# Inventory Watch README Audit

This fictional example shows the expected output format. It is not an audit of a real project.

| Priority | Finding | Reader impact | Recommended change |
| --- | --- | --- | --- |
| P1 | The opening does not identify a concrete user or outcome. | Visitors cannot quickly decide whether the tool solves their monitoring need. | Replace the generic claim with a one-sentence description of the monitored resource and alert outcome. |
| P0 | The installation command has no image tag, port, persistent data directory, or success check. | A first-time user cannot reliably start or verify the service. | Document one verified Compose path with prerequisites, persistent storage, and an expected local URL. |
| P2 | Feature bullets are ungrouped and do not help users select a workflow. | Important capabilities are hard to scan. | Group features by monitoring, detection, and notification jobs. |
| P1 | The support request has no verified destination. | Readers cannot act on it and maintainers risk inaccurate donation information. | Add a sponsorship section only after a maintainer provides a funding URL. |

## Proposed Structure

1. Project identity and outcome: explains the product in user language.
2. Screenshot or command outcome: makes the result tangible.
3. Quick start: gives one complete, verified route to the first successful result.
4. Key workflows: groups capabilities around user goals.
5. Configuration and troubleshooting links: keeps detailed material out of the primary path.
6. Support and license: retains repository stewardship information.
