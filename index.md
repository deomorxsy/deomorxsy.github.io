---
layout: index
title: Yare Yare ~/.ðÐ...
---

# {{page.title}}
<img class="product-img" src="images/kong1.jpg" alt="banana" />

## About

I am deomorxsy, a self-taught programmer.
<p>I also wrote my thoughts on Twitter.</p>
<p>Find me training in Github, Codewars, URIOnlineJudge, and HackerRank.</p>

## Blog

#### [recent posts]({{ site.baseurl }}/blog/)
<ul class="myposts">
{% for post in site.posts limit: 8%}
    <ul>
    <span class="postDate">{{ post.date | date: "%b-%-d-%Y" }}</span>
    <a href="{{ post.url }}" class="adatepost">{{ post.title }}</a>
    </ul>
{% endfor %}
</ul>


## Projects

- [Website <span class="mydivbars">///</span> **WIP**]({{ site.baseurl }})


