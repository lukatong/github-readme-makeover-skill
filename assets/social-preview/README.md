# Social Preview Assets

These `1280x640` PNG files are the prepared GitHub social previews for the README Makeover toolset.

| Repository | Image |
| --- | --- |
| [GitHub README Makeover Skill](https://github.com/lukatong/github-readme-makeover-skill) | [github-readme-makeover-skill.png](github-readme-makeover-skill.png) |
| [README Fact Checker](https://github.com/lukatong/readme-fact-checker) | [readme-fact-checker.png](readme-fact-checker.png) |
| [Open Source Screenshot Planner](https://github.com/lukatong/open-source-screenshot-planner) | [open-source-screenshot-planner.png](open-source-screenshot-planner.png) |
| [README Makeover Case Tracker](https://github.com/lukatong/readme-makeover-case-tracker) | [readme-makeover-case-tracker.png](readme-makeover-case-tracker.png) |

## Upload

GitHub does not currently expose Social Preview upload through the API available to GitHub CLI. Upload each image from its repository page:

1. Open the repository's **Settings** page.
2. Under **General**, find **Social preview**.
3. Select **Edit** and upload the matching PNG from this directory.

## Regenerate

Run the Windows PowerShell generator from the root of this repository:

```powershell
.\tools\social-preview\generate.ps1
```

The generator uses only Windows GDI+ and source text already present in these projects. It does not use external assets or fabricate product screenshots.
