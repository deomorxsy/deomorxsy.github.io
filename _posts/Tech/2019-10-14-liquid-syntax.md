---
layout: blog-posts
title: Liquid Syntax
date:   2019-10-14 11:06:30
categories: tech
tags:
- liquid, jekyll
---

__\|\> My liquid notes. WIP__

1. For Looping with lists
{% raw %}
```liquid	
{% assign beatles = "John, Paul, George, Ringo" | split: ", " %}
{% for member in beatles %}
	{{ member }}
{% endfor %}
```
{% endraw %}
