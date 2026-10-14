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
      <a class="button button-primary" href="{{ org.links.membership }}">Join Us</a>
      <a class="button button-secondary" href="{{ org.links.events }}">View Events</a>
    </div>
  </div>
  <div class="hero-pills">
    {% for pill in org.hero.pills %}
      <span>{{ pill }}</span>
    {% endfor %}
  </div>
</section>

<section class="intro-section" id="about">
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

<section class="programs" id="participate">
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
          <a class="button {% if item.action_key == 'membership' %}button-primary{% else %}button-outline{% endif %}" href="{{ org.links[item.action_key] }}">{{ item.action_label }}</a>
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
    {% if org.leadership.note %}
      <p class="small-note">{{ org.leadership.note }}</p>
    {% endif %}
  </article>
</section>
