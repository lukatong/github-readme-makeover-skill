---
name: github-readme-makeover
description: GitHub README audit and rewrite for open-source repositories with unclear onboarding, installation, screenshots, or sponsorship paths. Use when asked to improve, review, restructure, or rewrite a README.md for better first-time user adoption.
license: MIT
compatibility: Requires repository files or a GitHub URL and access to inspect the referenced documentation.
metadata:
  author: github-readme-makeover-skill
  version: 0.1.0
---

# GitHub README Makeover

Turn a repository README into a trustworthy first-run guide. Optimize for a reader to understand the project, decide whether it fits, and reach a first successful result with the least possible ambiguity.

## Operating Rules

- Inspect repository facts before drafting. Treat the existing README as unverified prose, not as a complete source of truth.
- Preserve verified commands exactly unless a correction is supported by repository configuration or maintainer documentation.
- Do not invent product features, benchmarks, compatibility, testimonials, security claims, community size, screenshots, badges, or funding links.
- Never imply that a maintainer endorses the rewrite. For external repositories, present the result as a proposal until accepted upstream.
- Prefer the smallest documentation change that fixes the reader's first-run path. Do not turn a README into a full manual.
- Keep headings concrete and scannable. Use a single primary installation path and link to alternatives.
- Use ASCII unless the repository's existing language and audience require otherwise.

## Required Context

Collect as much of the following as is available:

1. Repository URL or local path, default branch, license, and primary language.
2. Current `README.md`, `CONTRIBUTING.md`, docs entry points, and release notes.
3. Installation sources such as `package.json`, `pyproject.toml`, `Dockerfile`, Compose files, Makefiles, or release assets.
4. The target reader and their intended first successful result.
5. Existing screenshots, demo URLs, and funding configuration such as `.github/FUNDING.yml`.

If a key fact is missing, state the assumption in the audit. Ask one concise question only when the missing fact changes the recommended installation path or could cause an unsafe command.

## Audit Method

Evaluate the README in this order:

### 1. First Screen

Check whether the first screen answers all four questions quickly:

- What is this?
- Who is it for?
- What outcome does it provide?
- How can I try it?

The project name, one-sentence value statement, primary installation action, and a real product screenshot or terminal outcome should appear before long feature lists where practical.

### 2. First Successful Run

Trace the shortest documented path from a clean environment to a meaningful result. Flag:

- prerequisites that are hidden or missing;
- commands that cannot be copied safely;
- unexplained environment variables, ports, volumes, credentials, or permissions;
- multiple competing installation paths without a recommended default;
- a missing verification step after installation;
- cleanup, upgrade, or data-persistence risks that need a short warning.

### 3. Information Architecture

Check that content is arranged by reader need, usually in this sequence:

1. Project identity and outcome.
2. Screenshot or concise demo.
3. Primary install and verify path.
4. Key capabilities grouped by user job.
5. Links to configuration, alternatives, and troubleshooting.
6. Contributing, support, and license.

Remove repeated descriptions, badge walls, changelog-sized feature inventories, and implementation detail from the primary path. Link outward instead.

### 4. Trust and Accessibility

Check that images have useful alt text, headings are sequential, links have descriptive labels, commands have language fences, and warnings are specific. Confirm that every badge, version, support channel, and sponsor link is present in repository metadata or official documentation.

## Deliverables

Return the following sections in order.

### README Audit

Use a table with `Priority`, `Finding`, `Reader impact`, and `Recommended change` columns. Limit it to the highest-impact issues. Use `P0` only for a broken or unsafe installation path, `P1` for a first-run blocker, and `P2` for clarity or conversion improvements.

### Proposed Structure

Show the proposed heading outline. Briefly state why each moved or added section improves the reader's path.

### Rewrite

Provide a full replacement `README.md` in a Markdown fence only when the required facts are verified. Otherwise, provide an annotated draft with `[CONFIRM: ...]` markers for unverified details.

### Media Plan

Specify up to three screenshots or GIFs. Each item must name the exact screen or command outcome, its placement, and alt text. Favor real product states over decorative graphics.

### Verification Checklist

List the facts the maintainer should verify before merging:

- installation and upgrade commands;
- links and badges;
- image paths and alt text;
- supported versions and prerequisites;
- funding links and sponsor wording;
- rendered Markdown on desktop and mobile.

## Sponsorship Guidance

Only add a sponsorship section when `.github/FUNDING.yml`, the organization profile, or maintainer documentation supplies a verified destination. Keep it factual and short. The section may say that sponsorship supports maintenance, releases, documentation, or community support only when the project itself makes that claim.

Do not create artificial tier benefits, imply priority support, or insert a personal donation address into someone else's project.

## Output Quality Bar

Before delivering, verify that:

- the first install path contains all necessary prerequisites and a success check;
- every code block has a suitable language tag;
- headings are concrete and no more than two levels deep unless the repository requires more;
- the opening copy describes a user outcome rather than an implementation stack;
- no unverified statement appears as fact;
- the rewrite has not silently removed licensing, security, migration, or contributor information.
