---
title: "Hugo Starter Setup"
date: 2025-05-24
tags: ["hugo", "blog", "til"]
categories: []
---
After a few hours of tinkering, I finally have a basic Hugo blog setup with the PaperMod theme. Love the theme's simplicity and responsiveness. Here's a quick rundown of the setup process:
1. **Install Hugo**: Follow the [Hugo installation guide](https://gohugo.io/getting-started/installing/) to get Hugo up and running on your machine.
2. **Create a new site**: Run `hugo new site myblog --format "yaml"` to create a new Hugo site.
3. **Add the theme**: Clone the PaperMod theme into your site's themes directory:
   ```bash
   git submodule add https://github.com/adityatelange/hugo-PaperMod.git themes/PaperMod
    ```
4. **Start the server**: Navigate to your site directory and run `hugo server -D` to start the local development server.

Thats all! You can now start creating content in the `content` directory and customize your site using the theme's configuration options. The PaperMod theme is lightweight and has a clean design, making it perfect for a personal blog or portfolio.

I will be adding more content and tweaking the design as I go along. If you're looking for a simple yet effective Hugo theme, I highly recommend checking out [PaperMod](https://adityatelange.github.io/hugo-PaperMod/).