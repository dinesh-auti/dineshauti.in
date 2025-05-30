---
date: "2025-05-30T21:28:17+02:00"
title: "Hugo Open External Links in a New Tab"
tags: ["til", "hugo", "blog"]
categories: ["tech"]
---

The default behaviour in Hugo is not open a new tab for external links. This little snippet does the trick using render hooks. It looks complicated unless you have a basic understanding of the [go templating packages](https://pkg.go.dev/html/template)

Create a new file `layouts/_default/_markup/render-link.html` and add the below. Thats it! 
```html
<a href="{{- .Destination | safeURL -}}"{{ with .Title}} title="{{- . -}}"{{ end }}{{ if strings.HasPrefix .Destination "http" }} target="_blank" rel="nofollow noopener noreferrer" {{ end }}>{{- .Text  | safeHTML -}}</a>
```

{{< references >}}
1. [Hugo: open external links in a new tab](https://roneo.org/en/hugo-open-external-links-in-a-new-tab/)  
{{< /references >}}
