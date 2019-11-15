---
layout: blog-posts
title: "Reading time with Liquid (for jekyll)"
date: 2019-05-25 18:44:00
categories: tech
tags:
---

>PS: HTML and Liquid syntax INSIDE the \_includes folder

We can estimate the reading time with the measure called Words per Minute, (WPM).
An average person can read 180 words per minute in a computer monitor[^1]. So, we can include this in our blog post layout with one of these hibrid snippets between HTML (to style with CSS later) and Liquid:

{% raw %}
```html
<span class="reading-time" title="Estimated read time">
```
```liquid
  {% assign words = content | number_of_words %}
  {% if words < 360 %}
    1 min
  {% else %}
    {{ words | divided_by:180 }} mins
  {% endif %}
```
```html
</span>
```

{%  endraw %}

or, if you want to be more accurate:

```liquid
{% raw %}
{% assign words = content | number_of_words %}
  {% if words < 270 %}
    1 minute
  {% else %}
    {{ words | divided_by:135 }} minutes
  {% endif %}
{% endraw %}
```

You can call it with

```liquid
{%  raw %}
{% include read_time.html %}
{%  endraw %}
```

---

References:

[^1]: [WPM](https://en.wikipedia.org/wiki/Words_per_minute)