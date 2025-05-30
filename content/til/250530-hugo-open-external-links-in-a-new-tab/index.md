---
date: "2025-05-30T21:28:17+02:00"
title: "Hugo Open External Links in a New Tab"
tags: ["til", "hugo", "blog"]
categories: ["tech"]
---

The default behaviour in Hugo is not open a new tab for external links. This little snippet does the trick using render hooks.

Create a new file `layouts/_default/_markup/render-link.html` and add the below. Thats it!
```html
<a href="{{- .Destination | safeURL -}}"{{ with .Title}} title="{{- . -}}"{{ end }}{{ if strings.HasPrefix .Destination "http" }} target="_blank" rel="nofollow noopener noreferrer" {{ end }}>{{- .Text  | safeHTML -}}</a>
```
