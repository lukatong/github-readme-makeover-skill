# ProjectSend README Makeover Proposal

This is an independent documentation proposal for [projectsend/projectsend](https://github.com/projectsend/projectsend). It is not affiliated with, endorsed by, or merged into ProjectSend.

## Target And Snapshot

| Item | Value |
| --- | --- |
| Repository | [`projectsend/projectsend`](https://github.com/projectsend/projectsend) |
| Default branch reviewed | `main` |
| README commit reviewed | [`6e47d76`](https://github.com/projectsend/projectsend/commit/6e47d76ba6a8c5279ac7be73260c10f47a510c37) |
| Review date | 2026-08-14 |
| Target reader | A first-time self-hoster who wants a private client file-sharing portal. |
| Intended first success | Start ProjectSend with Docker, open `http://localhost:8090`, and create the administrator account. |

## Why This Is A Useful Case

ProjectSend's current README has a clear value statement, real screenshots, a recommended Docker path, and links to detailed deployment material. The audit does not treat a good README as a reason to invent problems.

The focused opportunity is the first-run order: the three large screenshots appear before the Docker quick start. A reader arriving to deploy the app must scroll through product presentation before seeing the recommended commands. Moving the verified quick start and its success check directly below the opening description makes the primary user job reachable sooner while keeping the screenshots and product detail intact.

## README Audit

| Priority | Finding | Reader impact | Recommended change |
| --- | --- | --- |
| P1 | The recommended Docker path begins after the feature list and three large screenshots. | A deployment-focused visitor must scroll past presentation material before reaching the first runnable command. | Move the existing Docker quick start and its local verification step immediately after the project description. |
| P2 | The Docker persistence warning is separated from the quick start by the result description. | A reader can start the service before noticing where application data and uploads are stored. | Keep the existing `DOCKER.md` warning directly beneath the first successful-run verification. |
| P2 | The audience-specific capability lists are useful but appear before the installation path. | First-time self-hosters cannot quickly distinguish the primary action from supporting product detail. | Retain the lists, but place them after Quick Start and Screenshots. |
| P2 | The README has no sponsor section. | This is not a defect: no `.github/FUNDING.yml` was present in the reviewed repository. | Do not add sponsorship language or links without a maintainer-provided destination. |

## Proposed Structure

1. Project identity and privacy-oriented outcome.
2. Quick Start with the existing Docker commands.
3. Success check and existing persistence/backup warning.
4. Screenshots that show the installed result.
5. Existing capability lists grouped by recipient, administrator, and installation needs.
6. Existing non-Docker installation, migration, contribution, security, and licensing material.

The proposal changes the reading order only. It does not change the verified Docker commands, product claims, screenshots, licensing terms, migration behavior, or contribution requirements.

## Proposed README

The full, review-ready Markdown proposal is in [proposed-README.md](proposed-README.md).

## Media Plan

No new media is proposed. The source README already contains three relevant product screenshots with descriptive alt text:

| Placement | Existing asset | Alt text |
| --- | --- | --- |
| After Quick Start | `.github/screenshots/dashboard.png` | The dashboard, showing counters for files, clients and groups alongside largest files, recent activity and system information. |
| After the dashboard | `.github/screenshots/files.png` | The file library, showing folders and files with thumbnails, sharing status and download counts. |
| After the file library | `.github/screenshots/portal.png` | A client's own page, listing the files shared with them with download buttons. |

## Verification Checklist

Before an upstream pull request, a ProjectSend maintainer should verify:

- `docker compose up -d` remains the recommended Docker command.
- `PROJECTSEND_EDITION=community` remains the required `.env` setting for the community edition.
- `http://localhost:8090` remains the expected first-run address.
- `DOCKER.md`, `INSTALL.md`, `MIGRATING-FROM-V1.md`, `CONTRIBUTING.md`, `LICENSE`, and `LICENSING.md` still have the referenced names and roles.
- Screenshot paths render from the repository root and their existing alt text remains accurate.
- There is still no maintainer-provided funding configuration to include.
- The proposed README renders correctly on GitHub desktop and mobile views.

## Sources

- [Reviewed README](https://github.com/projectsend/projectsend/blob/6e47d76ba6a8c5279ac7be73260c10f47a510c37/README.md)
- [Docker Compose definition](https://github.com/projectsend/projectsend/blob/6e47d76ba6a8c5279ac7be73260c10f47a510c37/compose.yaml)
- [Docker documentation](https://github.com/projectsend/projectsend/blob/6e47d76ba6a8c5279ac7be73260c10f47a510c37/DOCKER.md)
- [Repository metadata](https://api.github.com/repos/projectsend/projectsend)
