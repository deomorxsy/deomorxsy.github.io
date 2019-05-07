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

#### [recent posts]({{ site.blog }})
<ul class="myposts">
{% for post in site.posts limit: 8%}
    <ul>
    <span class="postDate">{{ post.date | date: "%b-%-d-%Y" }}</span>
    <a href="{{ post.url }}" class="adatepost">{{ post.title }}</a>
    </ul>
{% endfor %}
</ul>


## Projects

- [Website <span class="mydivbars">///</span> **WIP**]({{ site.post }})

## Quotes

<section class="quotes">
	<span class="h1">Quotes</span>
	<blockquote>
		<strong>"If you want to master something, teach it."</strong>
		<p>— Richard Feynman</p>
	</blockquote>
	<blockquote>
		<strong>There is nothing to writing. All you do is sit down at a typewriter and bleed.</strong>
    	<p>— Ernest Hemingway</p>
	</blockquote>
</section>

> últimos posts:

> Hello, World!()

>MEu gatinho é um flerkin muito mal humorado.


