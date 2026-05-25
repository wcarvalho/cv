{% extends "section.md" %}

{% block body %}
  {% for talk_group in items %}
**{{ talk_group.title }}**  
    {% for talk in talk_group.talks %}
  {{ talk.name }}. *{{ talk.location }}*. ({{ talk.date }})  
    {% endfor %}

  {% endfor %}
{% endblock body %}