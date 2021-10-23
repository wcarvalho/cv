{% extends "section.md" %}

{% block body %}

<!-- ### [Google Scholar](https://scholar.google.com/citations?user=tvJTXwoAAAAJ&hl=en)
 -->
<div class="publications">
{% for item in items %}
<div class="row publication">
  <div class="col-sm-3 center">
    <!-- <img class="pub-image responsive" src="/files/iclr_2017/figures/vrada_tsne.png"> -->
  </div>
  <div class="col-sm-7 center">
    <p>
    <strong> <a href="{{ item.url }}">{{ item.title }}</a> </strong> <br> 
    Sanjay Purushotham*, <span style="color: #9f30a5">Wilka Carvalho*</span>, and Yan Liu
    <br>
    <em> {{ item.venue }} , </em> {{ item.year }}
    </p>
  </div>
</div>
{% endfor %}
</div>
<p>* denotes co-first author</p>
{% endblock body %}


