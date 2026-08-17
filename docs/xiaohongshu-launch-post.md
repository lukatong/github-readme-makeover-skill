# Xiaohongshu Launch Post

## Title Options

1. 开源项目功能很强，但 README 把新用户劝退了怎么办？
2. 我做了一套开源 README 体检工具，不再靠 AI 瞎改文档
3. README 不只是说明书，它决定用户能不能跑起来

## Recommended Title

开源项目功能很强，但 README 把新用户劝退了怎么办？

## Body

很多开源项目不是功能不够好，而是 README 让第一次使用的人不知道从哪里开始。

常见情况：

- 安装命令藏在一大段功能介绍和截图后面。
- 环境变量、端口、数据持久化或升级风险没有说清楚。
- 截图很好看，但看不出“安装成功后应该看到什么”。
- README 写完后上游版本变了，旧建议还在被当作有效方案。

我最近做了一套公开的 README 改造工具链，目标不是让 AI 把文案写得更花，而是先核验事实，再把首次使用路径讲清楚。

它现在包含：

1. README Fact Checker
检查本地链接、图片路径、代码块语言、安装入口和 Funding 配置等基础事实。

2. Screenshot Planner
规划真正需要的产品截图：放在哪里、截什么状态、怎样写 alt text、怎样避免泄露 token/客户数据。

3. Evidence Report
把检查结果整理成可贴进 GitHub Issue 或 PR 的报告。

4. Freshness Checker
检查案例审计时引用的 README 版本，是否已经落后于上游。

5. PR Composer
只有在维护者明确认可方案后，才生成范围克制的 README-only PR 文案。

目前已经做了两个公开案例：

- ProjectSend：把 Docker 首次启动路径提前，减少自托管用户的滚动和上下文切换。
- Token Monitor：把下载和本地首次运行路径提前，避免用户先穿过很长的工具支持清单。

如果你有一个公开 GitHub 项目，README 存在安装、截图、结构或新手引导问题，可以提交一个公开审计请求：

https://github.com/lukatong/github-readme-makeover-skill/issues/new?template=readme-audit-request.yml

项目主页：

https://github.com/lukatong/github-readme-makeover-skill

请不要提交密码、token、私有地址、客户数据、生产日志或未公开安全问题。

## Image Order

1. Cover: `assets/social-preview/github-readme-makeover-skill.png`
2. Tool evidence: `assets/social-preview/readme-fact-checker.png`
3. Media planning: `assets/social-preview/open-source-screenshot-planner.png`
4. Public outcomes: `assets/social-preview/readme-makeover-case-tracker.png`

## Cover Text

```text
开源项目功能很强
但 README 把新用户劝退了怎么办？

先核验事实
再改首次使用路径
```

## Suggested Tags

```text
#开源项目 #GitHub #独立开发 #程序员 #开发者工具 #产品体验 #技术写作 #AI工具
```

## Publishing Notes

- 使用 4:5 竖版裁切或为小红书重新排版，不要直接拉伸 1280x640 的 GitHub Social Preview。
- 图片内不要放二维码、token、密码、私有 URL、客户名称或夸大性数据。
- 发布后将评论区第一个回复固定为 GitHub 项目主页和审计请求链接。
- 如果小红书将外链折叠，可在评论区补充 `github.com/lukatong/github-readme-makeover-skill`。
