---
layout: ccra
permalink: /
title: Carolina Compensation and Rewards Association
data_key: ccra
---

{% assign org = site.data[page.data_key] %}
{% unless org %}
  {% assign org = site.data.ccra %}
{% endunless %}

<section class="hero">
  <div class="hero-copy">
    <p class="eyebrow">{{ org.hero.eyebrow }}</p>
    <h1>{{ org.hero.title }}</h1>
    <p class="lede">{{ org.hero.lede }}</p>
    <div class="hero-pills">
      {% for pill in org.hero.pills %}
        <span>{{ pill }}</span>
      {% endfor %}
    </div>
  </div>
  <aside class="hero-panel">
    <p class="panel-label">{{ org.hero.panel_label }}</p>
    <ul class="fact-list">
      {% for fact in org.hero.facts %}
        <li>{{ fact }}</li>
      {% endfor %}
    </ul>
  </aside>
</section>

<section class="section-grid{% if org.overview_cards.size == 1 %} single-card-grid{% endif %}">
  {% for card in org.overview_cards %}
    <article class="content-card{% if card.accent %} accent-card{% endif %}">
      <p class="section-kicker">{{ card.kicker }}</p>
      <h2>{{ card.title }}</h2>
      {% for paragraph in card.paragraphs %}
        <p>{{ paragraph }}</p>
      {% endfor %}
    </article>
  {% endfor %}
</section>

<section class="programs">
  <div class="section-heading">
    <p class="section-kicker">{{ org.programs.kicker }}</p>
    <h2>{{ org.programs.title }}</h2>
  </div>
  <div class="program-grid">
    {% for item in org.programs.items %}
      <article class="program-card">
        <h3>{{ item.title }}</h3>
        <p>{{ item.description }}</p>
      </article>
    {% endfor %}
  </div>
</section>

<section class="section-grid">
  <article class="content-card">
    <p class="section-kicker">{{ org.audience.kicker }}</p>
    <h2>{{ org.audience.title }}</h2>
    <ul class="plain-list">
      {% for item in org.audience.items %}
        <li>{{ item }}</li>
      {% endfor %}
    </ul>
  </article>

  <article class="content-card">
    <p class="section-kicker">{{ org.leadership.kicker }}</p>
    <h2>{{ org.leadership.title }}</h2>
    <ul class="plain-list">
      {% for member in org.leadership.members %}
        <li><strong>{{ member.name }}</strong>, {{ member.role }}</li>
      {% endfor %}
    </ul>
    <p class="small-note">{{ org.leadership.note }}</p>
  </article>
</section>

<!-- <section class="closing-banner">
  <p class="section-kicker">{{ org.closing.kicker }}</p>
  <h2>{{ org.closing.title }}</h2>
  <p>{{ org.closing.body }}</p>
</section> -->
