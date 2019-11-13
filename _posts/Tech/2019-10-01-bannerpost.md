---
layout: blog-posts
title:  "Banner testing"
date:   2019-10-01 17:05:00
categories: tech
tags:
- gimp, banner
---

## Blog

<span class="yellow-circle">●</span>[Recent posts:]({{site.baseurl}}/blog/)

<ul class="myposts-index">
{% for post in site.posts limit: 8 %}
    <a class="post-title" href="{{ post.url }}">{{ post.title }}</a>
   	<span class="post-date">{{ post.date | date: "%b %d %Y" }}</span>
{% endfor %}
</ul>

---

## Github ? why ? 

![kamado gonpaoirrrasd](/images/banner-base-kny-102-min.jpg)


<div contenteditable="">this content can be edited.</div>

<p contenteditable="">Here we test the footnotes.</p>



---

~test~[^1]
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iste quas, esse laudantium quis ipsa consequuntur iure atque! Necessitatibus[^bignote] quam quidem illum, corrupti molestiae, maxime neque, consequuntur quia alias, modi commodi.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cupiditate rem ducimus dolores repellat itaque perferendis corporis ex dicta doloremque optio harum excepturi, ut, praesentium asperiores! Voluptatum amet perspiciatis iusto, fugiat!Lorem ipsum dolor sit amet, consectetur adipisicing elit. Harum, libero quia placeat necessitatibus culpa mollitia, illum, quam sed ratione ad eaque suscipit consectetur itaque quasi aperiam. Quaerat, nihil voluptas tenetur?Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eos unde quam autem fugit, aliquam perspiciatis, accusamus numquam, pariatur impedit excepturi debitis repellendus consectetur laboriosam voluptatem temporibus sunt illo magnam! Voluptates.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ullam repudiandae quidem, fuga eaque, deserunt eius. Aperiam, maxime fuga alias ad vel amet et facere soluta asperiores quasi. A, aperiam, ipsam.

---

#### References:
[^1]: This is the first footnote.
[^bignote]: Here's one with multiple paragraphs and code.
	Indent paragraphs to include them in the footnote.
---