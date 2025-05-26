---
title: "Hugo Homepage mainSections"
date: 2025-05-26
tags: ["hugo", "blog", "til"]
ShowToc: false
---

You can control which sections of content appear on your Hugo homepage using the `mainSections` setting in your site configuration (`config.yaml` or `config.toml`). By default, Hugo may show all posts, but specifying `mainSections` lets you limit the homepage to specific sections.

For example, to display only posts from the `posts` and `til` sections, add the following to your config:

```yaml
mainSections: ["posts", "til"]
```
