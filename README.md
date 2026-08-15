# GitHub README Makeover Skill

A reusable skill for turning a technically capable but hard-to-understand GitHub README into a clear onboarding and conversion document.

Use it when a repository has an unclear project pitch, a confusing installation path, scattered documentation, weak screenshots, or no visible sponsor/support path.

## What It Produces

- A short audit prioritized by user impact.
- A recommended README information architecture.
- A rewritten `README.md` ready for review or a pull request.
- Screenshot, GIF, and alt-text recommendations.
- A concise sponsor/support section when the project has a verified funding link.
- A verification checklist for commands, links, claims, and Markdown rendering.

## Install

Copy this repository's `SKILL.md` into a skill directory supported by your coding agent. For OpenCode, the portable layout is:

```text
.opencode/skills/github-readme-makeover/SKILL.md
```

Restart OpenCode after adding the skill so it is loaded by a new session.

## Use

Give the skill a repository URL or local repository path and state the target reader. Useful inputs include the current `README.md`, installation instructions, screenshots, documentation URLs, and verified sponsorship links.

Example request:

```text
Audit https://github.com/example/project for first-time self-hosters.
Produce a prioritized README audit and a replacement README. Preserve every
verified installation command and do not invent features, metrics, or sponsors.
```

## Workflow

1. Inspect repository metadata, documentation, installation files, and funding configuration.
2. Run [README Fact Checker](https://github.com/lukatong/readme-fact-checker) to verify local file references and basic documentation signals before drafting.
3. Identify the primary reader and their first successful outcome.
4. Audit the current README against the criteria in `SKILL.md`.
5. Propose the smallest structural changes that make installation and value clearer.
6. Write a complete replacement only after facts and commands are verified.
7. Report assumptions and anything that needs maintainer confirmation.

## Companion CLI

[README Fact Checker](https://github.com/lukatong/readme-fact-checker) is a zero-dependency CLI for deterministic checks before a rewrite. It detects missing local links and image paths, untagged code fences, missing setup files for documented commands, and funding configuration mismatches. It reads local files only and does not execute README commands.

## Example

The `examples/inventory-watch/` directory contains a fictional before/after case. It demonstrates the expected deliverables without claiming changes to a real project.

## Case Studies

- [ProjectSend README Makeover Proposal](examples/projectsend/README.md): a fact-checked, independent proposal that moves the existing Docker first-run path ahead of product detail for a first-time self-hoster. It is not an upstream change or maintainer endorsement.
- [Token Monitor README Makeover Proposal](examples/token-monitor/README.md): a fact-checked, independent proposal for a desktop developer tool that promotes its existing download and local-first path ahead of detailed tool-reference material, using its verified GitHub Sponsors destination only.

## Scope

This skill improves repository-facing documentation. It does not:

- claim unverified compatibility, performance, adoption, security, or sponsor information;
- replace product documentation that belongs in a dedicated docs site;
- add donation links without a maintainer-provided funding destination;
- change code, deployment configuration, licenses, or release processes unless explicitly requested.

## License

[MIT](LICENSE)
