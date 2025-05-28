---
title: "Hugo Starter Setup"
date: 2025-05-27
tags: ["hugo", "blog"]
categories: ["tech"]
---

### Base setup for Hugo with PaperMod theme
After a few hours of tinkering, I finally have a basic Hugo blog setup with the PaperMod theme. Love the theme's simplicity and responsiveness. Here's a quick rundown of the setup process:
1. **Install Hugo**: Follow the [Hugo installation guide](https://gohugo.io/getting-started/installing/) to get Hugo up and running on your machine.
2. **Create a new site**: Run `hugo new site myblog --format "yaml"` to create a new Hugo site.
3. **Add the theme**: Clone the PaperMod theme into your site's themes directory:
   ```bash
   git submodule add https://github.com/adityatelange/hugo-PaperMod.git themes/PaperMod
    ```
4. **Start the server**: Navigate to your site directory and run `hugo server -D` to start the local development server.

Thats all! You can now start creating content in the `content` directory and customize your site using the theme's configuration options.


### Data organization
I have posts and til (Today I Learned) notes organized in separate directories under `content/`. The `posts` directory contains my main blog posts, while the `til` directory is for quick notes and tips. This separation helps keep my content organized and makes it easier to manage.

I decided to go with `YYMMDD-slug` format for my post filenames, which is a common convention in Hugo. It allows for easy sorting and makes the URLs more readable.

A quick script to help me create new posts in the correct format:
```bash
#!/bin/bash

# Usage: ./newpost.sh "Post Title" [--kind til]
# Default kind
kind="default"

# Parse arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --kind) kind="$2"; shift ;;
        *) title="$1" ;;
    esac
    shift
done

# Validate input
if [ -z "$title" ]; then
    echo "❌ Error: Please provide a post title."
    echo "✅ Usage: ./newpost.sh \"My Post Title\" [--kind til]"
    exit 1
fi

# Generate slug and path
today=$(date +"%y%m%d")
slug=$(echo "$title" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -cd '[:alnum:]-')

if [ $kind = "til" ]; then
    path="til/${today}-${slug}"
else
    path="posts/${today}-${slug}"
fi

# Create new post with correct archetype
echo "📄 Creating post: $path (kind: $kind)"
hugo new --kind "$kind" "$path/index.md"
```

### Image optimization
Over time, the number of images in a blog can grow, and it becomes important to optimize them for faster page loads. I learned that **only images stored in page bundles (content/section/page/index.md) or the assets/ folder** can be resized and processed using Hugo’s built-in functions like .Resize, .Fit, .Convert, etc.

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

I will be adding more content and tweaking the design as I go along. If you're looking for a simple yet effective Hugo theme, I highly recommend checking out [PaperMod](https://adityatelange.github.io/hugo-PaperMod/). It's lightweight and has a clean design, making it perfect for a personal blog or portfolio.