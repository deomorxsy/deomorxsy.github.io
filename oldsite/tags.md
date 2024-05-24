---
layout: tags-page
---

<div class="snippets">
  <h1 class="snippets-heading">Articles tagged with "{{ page.tag-name }}"</h1>
</div>
  {% for post in site.posts %}
    {% if post.tags contains page.tag-name %}
      {% include snippet.html %}
    {% endif %}
  {% endfor %}


