---
layout: index
title: Home
---

# {{page.title}}
![banana](images/kong1.jpg)
## About
I am deomorxsy, a self-taught programmer.
Find me training in Github, Codewars, URIOnlineJudge, and HackerRank. 
I also wrote my thoughts on Twitter.

## Latest posts

<ul class="myposts">
{% for post in site.posts limit: 8%}
    <ul>
    <span class="postDate">{{ post.date | date: "%b-%-d-%Y" }}</span>
    <a href="{{ post.url }}">{{ post.title }}</a>
    </ul>
{% endfor %}
</ul>


## Projects

Kaijū (怪獣, kaijū?) é uma palavra japonesa que significa "besta estranha", "animal incomum", mas que costuma ser traduzida como "monstro". Especificamente, é usada para se referir a um gênero de tokusatsu, que são filmes de efeitos especiais, normalmente de heróis ou monstros. Termos relacionados incluem "kaiju eiga (怪獣映画 ? filme de monstro)", um filme com kaiju, "kaijin" (referindo-se a monstros vagamente humanóides) e daikaijū (大怪獣? monstro grande), especificamente se referindo a uma variação maior de monstro.

Temos como exemplo os seguintes filmes com Kaiju:

- Gojira (1954)
- Rodan (1956)
- Varan the Unbelievable (1958)
- Mothra (1961)
- Ghidorah the Three Headed Monster (1964)
- Gamera (1965)


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
