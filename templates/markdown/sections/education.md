{% extends "section.md" %}

{% block body %}

<div class="publications">
{% for school in items %}
<div class="row publications">
  <div class="col-sm-3 center">
    <img class="pub-image responsive" width="100px" src="/files/cv/{{school.image}}">
  </div>
  <div class="col-sm-7 center">
    <strong> {{school.school}} </strong>, {{school.location}}<br>
    {% if school.department %}
      <i>{{school.department}}</i>,
    {% endif %}
    {{school.degree}}, {{school.completion}}
  </div>
</div>
{% endfor %}
</div>
{% endblock body %}
