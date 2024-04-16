---
layout: blog-posts
title:  "List and display png files on CLI"
date:   2024-04-14
categories: tech
tags:
- shellscript
---

## list and display png files on CLI

find all filetype png, sort by time, newest first, grep a pattern, filter the stream of its filename and pass the filename as stdin to the sxiv image viewer.

```sh
; find ./ \( -iname '*.png' \) -type f -exec ls -lt --time-style=+"%Y-%m-%d %T" {} + | sort -k6,7 | grep "fun" | awk {'print '} | sxiv -i
```

