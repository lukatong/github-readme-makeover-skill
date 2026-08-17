# 别让 AI 直接改 README：我做了一套先核验、再改写、再追踪结果的开源工具链

很多开源项目的功能没有问题，真正让新用户放弃的，是第一次打开 README 后不知道下一步该做什么。

常见场景包括：

- 快速启动命令藏在长篇功能介绍、Badge 和截图后面。
- `.env`、端口、持久化目录、权限和升级风险没有出现在首次路径上。
- 截图很多，但用户看不出“安装成功后应该看到什么”。
- README 审计写完后，上游已经更新，旧建议仍被当作有效方案。

这类问题看起来适合直接交给 AI 改写，但如果先让模型自由发挥，通常会出现另一个问题：它会把未经确认的功能、兼容性、下载量、赞助链接或安装步骤写成事实。

所以我做了一套偏保守的开源 README 工具链：先做可验证检查，再生成审计报告，最后才写 README 提案。上游维护者明确认可方案之前，工具不会自动创建 PR。

项目入口：

https://github.com/lukatong/github-readme-makeover-skill

## 一、先定义边界：什么能自动验证，什么不能

工具链把输出分成两类。

第一类是确定性事实，可以由本地仓库文件检查：

- README 中的相对链接和图片路径是否存在。
- 代码块是否标记了语言。
- README 是否提到一个不存在的根目录文档，例如 `INSTALL.md`。
- README 出现实际 Docker、Node 或 Python 安装命令时，仓库是否有对应的入口文件。
- README 的资金链接与 `.github/FUNDING.yml` 是否存在明显不一致。

第二类不能由工具替代维护者确认：

- 命令是否真的在所有环境执行成功。
- 功能、性能、兼容性或安全说明是否准确。
- 维护者是否认可某个 README 结构调整。
- 赞助文案和支持权益是否真实。

这条边界很重要。工具能提供证据，但不应该把证据包装成产品真相或维护者背书。

## 二、工具链的六个环节

### 1. README Fact Checker：先检查本地事实

[README Fact Checker](https://github.com/lukatong/readme-fact-checker) 是零运行时依赖的 Node.js CLI。

```bash
node bin/readme-fact-check.js /path/to/repository
```

它输出 Markdown 或 JSON 报告。`--strict` 模式下，warning 也会导致非零退出码，适合放进 CI。

```bash
node bin/readme-fact-check.js /path/to/repository --strict --format json
```

它不会执行 README 中的命令，也不会上传仓库内容。

### 2. Screenshot Planner：截图不是装饰

[Open Source Screenshot Planner](https://github.com/lukatong/open-source-screenshot-planner) 不生成假截图，也不要求先上浏览器自动化。

它只做一件事：把用户的首次成功路径转成一个可执行的截图捕获计划。

每张图都需要回答一个具体问题：

- 安装成功后，用户会看到什么？
- 核心工作流到底长什么样？
- 截图应该放在哪个 README 小节后？
- Alt text 怎样描述真正可见的状态？
- 怎样避免把 token、私有地址、客户名称和真实文件放进截图？

通常最多三张图：首次成功状态、核心管理状态、最终用户结果。比一排截图更容易让读者理解产品。

### 3. Evidence Report：把检查结果变成可讨论材料

[README Evidence Report](https://github.com/lukatong/readme-evidence-report) 汇总 Fact Checker、目标读者、首次成功结果和可选截图计划。

```bash
node bin/readme-evidence-report.js /path/to/repository \
  --fact-checker /path/to/readme-fact-checker \
  --reader "首次自托管用户" \
  --first-success "启动服务并打开初始化页面"
```

输出内容适合直接放在 GitHub Issue 或 PR 描述中：有哪些确定性发现、优先级是什么、哪些事实仍需要维护者确认。

### 4. README Makeover Skill：再处理信息架构和文案

[GitHub README Makeover Skill](https://github.com/lukatong/github-readme-makeover-skill) 的目标不是把 README 写成长营销页，而是让用户尽快完成三个判断：

1. 这是什么，适合谁？
2. 我如何以最短路径跑起来？
3. 我怎样确认自己已经成功？

它会要求保留已经验证的命令，明确未确认项，并把大规模“换皮”拆成维护者可审查的小改动。

### 5. Freshness Checker：防止案例过期

这是我在第一个真实案例里遇到的问题。

README 提案审计完成后，上游 README 可能已经有新的提交。如果不检查，旧提案会继续被当成当前事实。

[README Freshness Checker](https://github.com/lukatong/readme-freshness-checker) 比较审计时的 README SHA 和上游默认分支当前 README SHA：

```bash
node bin/readme-freshness-check.js projectsend/projectsend \
  --reviewed-sha 6e47d76ba6a8c5279ac7be73260c10f47a510c37
```

如果 README 已变化，它返回 `needs-revalidation` 和退出码 `1`。这不是失败，而是提醒：在开 PR 前先重新核对事实。

### 6. PR Composer：认可后才写 PR 文案

[README PR Composer](https://github.com/lukatong/readme-pr-composer) 有一个刻意的限制：必须传入 `--approved` 才会生成 PR 草稿。

```bash
node bin/readme-pr-compose.js \
  --approved \
  --change "将 Docker 快速启动移动到截图之前" \
  --reader "首次自托管用户" \
  --issue "https://github.com/projectsend/projectsend/issues/1635"
```

它只生成标题、变更说明、验证清单和范围边界；不会创建 fork、branch、commit 或 pull request。

## 三、真实案例：ProjectSend

第一个公开案例是 [ProjectSend](https://github.com/projectsend/projectsend)，一个自托管的客户端文件分享工具。

原 README 已经有清晰的价值说明、真实产品截图和 Docker 快速启动。审计并没有把“README 质量不错”硬说成问题，而是只聚焦一个可讨论的读取顺序：

> 对第一次自托管的用户来说，推荐的 Docker 快速启动出现在功能介绍和三张大截图之后。

提案是将现有 Docker 命令和成功校验提前，不修改命令、不修改产品说明、不修改迁移内容、不修改许可证。

公开案例：

https://github.com/lukatong/github-readme-makeover-skill/tree/main/examples/projectsend

维护者沟通：

https://github.com/projectsend/projectsend/issues/1635

这个 Issue 目前仍开放。没有维护者回复、没有 PR、没有 merge，就不会在案例 Tracker 中写成“已获认可”。

而且上游 README 后续已经更新过，所以 Tracker 已记录必须重新验证：

https://github.com/lukatong/readme-makeover-case-tracker

## 四、为什么不直接做“一键改 README”

自动生成完整 README 很容易，但维护者不一定会接受，原因通常不是文笔，而是维护成本：

- 一个大范围视觉重写很难 review。
- AI 容易引入无法验证的事实。
- 截图、命令和链接很容易随上游变化过期。
- 外部贡献者如果直接提交全站风格改造，维护者往往没有精力维护。

因此我更倾向于这个流程：

```text
检查本地事实
-> 明确目标读者和首次成功结果
-> 规划真实媒体
-> 生成可讨论的证据报告
-> 获得维护者明确反馈
-> 重新检查 README 是否过期
-> 提交小范围 README-only PR
-> 记录公开结果
```

这比“AI 帮我美化 README”慢一点，但更接近能被上游合并的贡献。

## 五、如何提交公开审计请求

如果你维护一个公开 GitHub 项目，README 有以下问题：

- 新用户不知道如何安装或验证成功。
- 截图缺失、过期或无法证明关键工作流。
- README 结构过长，快速启动被埋没。
- 安装文档、链接和配置文件之间可能不同步。

可以提交公开审计请求：

https://github.com/lukatong/github-readme-makeover-skill/issues/new?template=readme-audit-request.yml

提交时请提供：

- 公开仓库链接。
- 目标读者。
- 希望读者完成的首次成功结果。
- 已知 README 问题或关联 Issue。

请不要提交密码、token、私有地址、客户数据、生产日志或未公开安全问题。

## 六、后续计划

当前阶段不急着增加更多工具。更重要的是收集真实维护者反馈：哪些审计有价值、哪些提案被接受、哪些原因导致被拒绝或过期。

所有公开案例、上游 Issue、PR 和结果都会记录在：

https://github.com/lukatong/readme-makeover-case-tracker

如果你也遇到过“项目能用，但 README 让人不敢用”的情况，欢迎提交一个公开案例。

## 标签

```text
开源 GitHub README 技术写作 开发者工具 Node.js CLI 自托管 AI 工具
```
