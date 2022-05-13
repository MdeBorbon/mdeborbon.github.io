---
layout: page
permalink: /publications/
title: Publications
description:
years: [2022, 2021, 2020, 2019, 2017]
nav: true
---

All my papers are available on [arXiv](https://arxiv.org/search/math?query=de+Borbon%2C+Martin&searchtype=author&abstracts=show&order=-announced_date_first&size=50)

<!-- _pages/publications.md -->
<div class="publications">

{%- for y in page.years %}
  <h2 class="year">{{y}}</h2>
  {% bibliography -f papers -q @*[year={{y}}]* %}
{% endfor %}

</div>
