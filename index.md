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

<section class="hero" aria-labelledby="hero-title">
  <div class="hero-copy">
    <p class="eyebrow">{{ org.hero.eyebrow }}</p>
    <h1 id="hero-title">{{ org.hero.title }}</h1>
    <p class="lede">{{ org.hero.lede }}</p>
    <div class="hero-actions">
      <a class="button button-primary" href="#programs">See programming</a>
      <a class="button button-secondary" href="#leadership">Founding leadership</a>
    </div>
  </div>
  <div class="hero-pills">
    {% for pill in org.hero.pills %}
      <span>{{ pill }}</span>
    {% endfor %}
  </div>
</section>

<section class="quick-facts" aria-labelledby="quick-facts-title">
  <div class="section-heading">
    <p class="section-kicker">{{ org.hero.panel_label }}</p>
    <h2 id="quick-facts-title">Built for both Carolinas.</h2>
  </div>
  <div class="fact-grid">
      {% for fact in org.hero.facts %}
        <p>{{ fact }}</p>
      {% endfor %}
  </div>
</section>

<section class="intro-section">
  {% for card in org.overview_cards %}
    <div class="section-heading">
      <p class="section-kicker">{{ card.kicker }}</p>
      <h2>{{ card.title }}</h2>
    </div>
    <article class="intro-copy">
      {% for paragraph in card.paragraphs %}
        <p>{{ paragraph }}</p>
      {% endfor %}
    </article>
  {% endfor %}
</section>

<section class="programs" id="programs">
  <div class="section-heading">
    <p class="section-kicker">{{ org.programs.kicker }}</p>
    <h2>{{ org.programs.title }}</h2>
  </div>
  <div class="program-list">
    {% for item in org.programs.items %}
      <article class="program-row">
        <span>0{{ forloop.index }}</span>
        <div>
          <h3>{{ item.title }}</h3>
          <p>{{ item.description }}</p>
        </div>
      </article>
    {% endfor %}
  </div>
</section>

<section class="detail-grid">
  <article id="audience">
    <div class="section-heading">
      <p class="section-kicker">{{ org.audience.kicker }}</p>
      <h2>{{ org.audience.title }}</h2>
    </div>
    <div class="plain-list">
        {% for item in org.audience.items %}
          <p>{{ item }}</p>
        {% endfor %}
    </div>
  </article>

  <article id="leadership">
    <div class="section-heading">
      <p class="section-kicker">{{ org.leadership.kicker }}</p>
      <h2>{{ org.leadership.title }}</h2>
    </div>
    <div class="leadership-list">
      {% for member in org.leadership.members %}
        <p><strong>{{ member.name }}</strong><span>{{ member.role }}</span></p>
      {% endfor %}
    </div>
    <p class="small-note">{{ org.leadership.note }}</p>
  </article>
</section>

<section class="closing-banner">
  <div>
    <p class="section-kicker">Next</p>
    <h2>More launch details will be posted as the chapter moves into active programming.</h2>
  </div>
  <a class="button button-primary" href="#programs">Review the plan</a>
</section>
