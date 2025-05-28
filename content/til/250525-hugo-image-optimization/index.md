---
title: "Hugo Image Optimization"
date: 2025-05-25
tags: ["til", "hugo", "blog"]
categories: []
---

Over time, the number of images in a Hugo blog can grow, and it becomes important to optimize them for faster page loads. I learned that **only images stored in page bundles (content/section/page/index.md) or the assets/ folder** can be resized and processed using Hugo’s built-in functions like .Resize, .Fit, .Convert, etc.

The static/ folder is not processed — files placed there are served **as-is**, without optimization.

To automate image optimization for blog posts, I added a custom shortcode in layouts/shortcodes/figure.html:

```html
{{ $resizeParam := .Get "size" | default "700x" }}
{{ $img := .Page.Resources.GetMatch (.Get "src") }}
{{ if not $img }}
    <p style="color:red;">❌ Image not found: {{ .Get "src" }}</p>
{{ else if and (not (eq $img.MediaType.SubType "svg")) }}
    {{ $resized := $img.Resize (printf "%s webp" $resizeParam) }}
    <figure>
        <img src="{{ $resized.RelPermalink | safeURL }}" alt="{{ .Get "alt" | safeHTMLAttr }}" loading="lazy" decoding="async" />
        {{ if .Get "caption" }}
        <figcaption>{{ .Get "caption" }}</figcaption>
        {{ end }}
    </figure>
{{ else }}
    <p style="color: orange;">⚠️ Image found, but unsupported for resizing: {{ .Get "src" }}</p>
{{ end }}
```

I use it in Markdown like this:
```markdown
{{ < figure src="image.jpg" alt="Image description" caption="Image caption" size="500x" > }}
```

This way, all images in my content posts are:
- Resized to 700px wide, unless specified otherwise
- Converted to WebP for better compression
- Lazy-loaded for performance