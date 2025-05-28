---
date: "{{ .Date }}"
draft: true
title: "{{ replace (replaceRE `^\d{6}-` "" .File.ContentBaseName) "-" " " | title }}"
tags: ["til"]
categories: []
---