---
layout: index
title: Home
---

# Yare Yare \~/.ðÐ...
<img class="product-img" src="images/kong1.jpg" alt="banana" />

## About

<section class="quotes">
	<div class="summary-index"> I am deomorxsy, a programmer from Brazil. Find me training in Github, Codewars, URIOnlineJudge, and HackerRank.
	</div>
	<hr class="-center">
</section>


### *Latest blogs*

[✍ all entries]({{site.baseurl}}/blog/)

<ul class="myposts-index">
{% for post in site.posts limit:8 %}
	<ul class="alter-padding" style="padding-left: 0px; margin-left: 0px;">
    <span class="old-postDate">{{ post.date | date: "%b %d %Y  ー" }}</span>
    <a href="{{ post.url }}">{{ post.title }}</a>
	</ul>
{% endfor %}
</ul>

---

## Projects

+ [Website <span class="mydivbars">///</span> **WIP**]({{site.baseurl}})
+ [mzll-GSW]({{site.baseurl}}/mzll-GSW), "Getting started with the web" from Mozilla Developer.
+ [Jukebox-js]({{site.baseurl}}/jukebox)


