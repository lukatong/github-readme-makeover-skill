# Token Monitor README Makeover Proposal

This is an independent documentation proposal for [Javis603/token-monitor](https://github.com/Javis603/token-monitor). It is not affiliated with, endorsed by, or merged into Token Monitor.

## Target And Snapshot

| Item | Value |
| --- | --- |
| Repository | [`Javis603/token-monitor`](https://github.com/Javis603/token-monitor) |
| Default branch reviewed | `main` |
| README commit reviewed | [`8f54d59`](https://github.com/Javis603/token-monitor/commit/8f54d59fe25d6d848c40f3ecc60bb4abb43749b9) |
| Review date | 2026-08-14 |
| Target reader | A developer who wants to see local AI coding-tool token usage without configuring a server. |
| Intended first success | Download the correct release for the current operating system, launch it, and see local usage collection start. |

## Why This Is A Useful Case

Token Monitor's README has strong product media, a specific value statement, platform release options, and an explicit local-first first-run explanation. It also supports a large and growing list of AI coding tools, which is useful reference material.

The first action for a new visitor, however, is downloading the desktop app. The current README places the detailed supported-tools matrix and a multi-image showcase before installation. For a reader who already knows they use Claude Code, Codex, Cursor, or OpenCode, this delays the shortest route to the product. This proposal moves the existing installation and first-run material near the top, then keeps tool coverage, showcase images, sync setup, and advanced deployment documentation below it.

## README Audit

| Priority | Finding | Reader impact | Recommended change |
| --- | --- | --- |
| P1 | The first installation section appears after the supported-tools matrix and product showcase. | A visitor who already knows the product is relevant must scroll through extensive reference material before reaching the download action. | Move the existing release download options and local-first first-run explanation below the project description and demo. |
| P2 | Platform downloads are expressed in prose after the release link. | New users need to scan several lines to select the artifact for their operating system. | Present the existing macOS, Windows, and Linux release formats in a concise platform table under a `Download` heading. |
| P2 | The README's early detail is valuable, but it mixes product qualification with setup guidance. | Readers cannot easily choose between "is my tool supported?" and "how do I install it?". | Put download and local first run first, then retain the supported-tools matrix as a dedicated reference section. |
| P2 | A GitHub Sponsors handle is configured but not surfaced in the README. | Users who want to fund ongoing compatibility work may not discover the verified support route. | Add one factual line linking to [GitHub Sponsors for Javis603](https://github.com/sponsors/Javis603), without inventing tiers or support benefits. |

## Proposed Structure

1. Project identity, one-sentence outcome, and existing demo GIF.
2. Download table using the existing GitHub Releases destination.
3. Existing local-first first-run explanation.
4. Existing short answer to "what does it track?".
5. Existing supported-tools matrix and its data-path notes.
6. Existing product showcase, features, sync options, advanced setup, privacy, contributing, acknowledgements, and license.
7. A concise, verified GitHub Sponsors link near the end.

The proposal does not alter product claims, platform support, release artifacts, data paths, privacy claims, or synchronization instructions. It only changes the reading order and gives the first download decision a clearer structure.

## Proposed Opening

```markdown
<p align="center">
  <img src=".github/assets/app.png" alt="Token Monitor logo" width="120">
</p>

# Token Monitor

One live dashboard for token usage and AI tool limits across your AI coding tools, synced across your machines.

<p align="center">
  <img src=".github/assets/demo.gif" alt="Token Monitor dashboard updating AI coding-tool usage">
</p>

## Download

Download the latest build from [GitHub Releases](https://github.com/Javis603/token-monitor/releases).

| Platform | Release artifact |
| --- | --- |
| macOS (Apple Silicon) | Signed and notarized `.dmg` |
| macOS (Intel) | Signed and notarized x64 `.dmg` |
| Windows 10/11 | Setup or portable `.exe` |
| Linux x64 | `.AppImage` |

## First Run

Local mode is the default. Launch Token Monitor and it starts tracking this device; no hub, agent, or configuration is required.

To track usage across more than one machine, choose a sync mode under Settings -> Multi-device Sync. The rest of this README covers the available hub options and their setup.

## What It Tracks

Token Monitor reads local usage data for 30+ AI coding tools, including Claude Code, Codex, Cursor, GitHub Copilot, and OpenCode. It shows current usage, tool limits where available, historical trends, and breakdowns by tool, device, model, session, or project.

## Supported Tools

[Keep the existing supported-tools table and notes unchanged here.]
```

## Sponsorship Copy

The following is the only sponsorship wording proposed, based on the reviewed `.github/FUNDING.yml` entry `github: Javis603`:

```markdown
## Support

Support ongoing maintenance through [GitHub Sponsors](https://github.com/sponsors/Javis603).
```

No tier benefits, response-time promises, or destinations beyond the configured GitHub Sponsors account are proposed.

## Media Plan

No new media is required. Keep the existing demo GIF directly beneath the opening description. Retain the existing showcase images after `Supported Tools`, where a reader evaluating feature depth can browse them without delaying installation.

## Verification Checklist

Before an upstream pull request, the maintainer should verify:

- The current GitHub Releases page still provides signed/notarized macOS builds, Windows setup and portable executables, and a Linux x64 AppImage.
- Local mode still starts without a hub, agent, or configuration.
- The `Settings -> Multi-device Sync` label and flow remain current.
- The product still supports the named tools and the stated 30+ count.
- Existing images and their paths render from the repository root.
- `.github/FUNDING.yml` still contains `github: Javis603`.
- The condensed opening does not remove an installation warning, privacy condition, or supported-tool limitation found later in the README.

## Sources

- [Reviewed README](https://github.com/Javis603/token-monitor/blob/8f54d59fe25d6d848c40f3ecc60bb4abb43749b9/README.md)
- [Funding configuration](https://github.com/Javis603/token-monitor/blob/8f54d59fe25d6d848c40f3ecc60bb4abb43749b9/.github/FUNDING.yml)
- [Repository metadata](https://api.github.com/repos/Javis603/token-monitor)
