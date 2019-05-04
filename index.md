---
layout: index
title: Yare Yare ~/.ðÐ...
---

# {{page.title}}
![banana](images/kong1.jpg)
## About

I am deomorxsy, a self-taught programmer.
<p>I also wrote my thoughts on Twitter.</p>
<p>Find me training in Github, Codewars, URIOnlineJudge, and HackerRank.</p>

## Blog

#### Latest posts
<ul class="myposts">
{% for post in site.posts limit: 8%}
    <ul>
    <span class="postDate">{{ post.date | date: "%b-%-d-%Y" }}</span>
    <a href="{{ post.url }}" class="adatepost">{{ post.title }}</a>
    </ul>
{% endfor %}
</ul>


## Projects

- [website](deomorxsy.github.io/blog)



<ul>
  {% assign mypages = site.pages | sort: "order" %}
    {% for page in mypages %}
    <li><a href="{{ page.url | absolute_url }}">{{ page.title }}</a></li>
    {% endfor %}
</ul>

O mais famoso Kaiju é o [Godzilla](https://pt.wikipedia.org/wiki/Godzilla).

últimos posts:

- Hello, World!()

MEu gatinho é um flerkin muito mal humorado.
