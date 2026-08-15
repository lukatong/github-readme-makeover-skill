# Inventory Watch

Monitor a product, status page, or public web page and receive an alert when the content you care about changes.

> Fictional example: commands, image names, ports, and links below are placeholders and must be verified before use.

![Inventory Watch dashboard showing two monitored pages, their last check time, and one detected change.](docs/images/dashboard.png)

## Quick Start

Prerequisite: Docker with Docker Compose v2.

Create `compose.yaml`:

```yaml
services:
  inventory-watch:
    image: [CONFIRM: registry/image:version]
    ports:
      - "[CONFIRM: host-port]:[CONFIRM: container-port]"
    volumes:
      - "[CONFIRM: local-data-path]:[CONFIRM: container-data-path]"
```

Start the service:

```bash
docker compose up -d
```

Open `[CONFIRM: local URL]`. Add a monitored page, save it, and run its first check to verify the installation.

## What You Can Monitor

- Watch a full page or a selected part of a page.
- Compare detected changes with the previous saved version.
- Send notifications through [CONFIRM: supported notification channels].

## Next Steps

- [Configure monitors](docs/configuration.md)
- [Set up notifications](docs/notifications.md)
- [Troubleshoot deployment](docs/troubleshooting.md)

## Support

[CONFIRM: Add the maintainer's verified sponsorship or funding link here.]

## License

[CONFIRM: Link the repository license.]
