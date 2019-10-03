---
layout: index
title: Yare Yare \~/.ðÐ...
---

# {{page.title | escape}}
<img class="product-img" src="images/kong1.jpg" alt="banana" />

## About

<section class="quotes">
	<div class="summary-index">I am deomorxsy, a programmer from Brazil. I also wrote my thoughts on Twitter. Find me training in Github, Codewars, URIOnlineJudge, and HackerRank.
	</div>
	<hr class="-center">
</section>

## Blog

#### [recent posts]({{site.baseurl}}/blog/)
<ul class="myposts">
{% for post in site.posts limit: 8%}
    <ul>
    <span class="postDate">{{ post.date | date: "%b-%-d-%Y" }}</span>
    <a href="{{ post.url }}" class="adatepost">{{ post.title }}</a>
    </ul>
{% endfor %}
</ul>


## Projects

+ [Website <span class="mydivbars">///</span> **WIP**]({{site.baseurl}})

+ [mzll-GSW]({{site.baseurl}}/mzll-GSW), "Getting started with the web" from Mozilla Developer.

+ [Jukebox-js]({{site.baseurl}}/jukebox)
