# {{ page.group_name }} — Policies

**Last Updated:** {{ site.last_updated }}

These policies apply to membership, programs, meetings, events, professional development offerings, committee activities, websites, online spaces, and related communications provided by **{{ page.organizer_legal }}**, doing business as **{{ page.group_name }}**.

Members, applicants, guests, speakers, volunteers, sponsors, and other participants are encouraged to review the following documents before using the website, applying for membership, registering for a program, attending a meeting, or participating in any related activity.

---

## 📜 Policies

{% assign policy_ids = page.policies %}

{% for policy_id in policy_ids %}
  {% assign policy = site.policies_catalog[policy_id] %}
  {% if policy %}
- **[{{ policy.label }}]({{ policy.href }})**  
  {{ policy.description }}
  {% else %}
- **{{ policy_id }}** (missing entry in `_config.yml` `policies_catalog`)
  {% endif %}
{% endfor %}

---

## 📬 Contact

Questions or concerns regarding these policies may be directed to:

- **{{ page.contact_email | default: "president@carolinacompandrewards.org" }}**
- Program-specific contact details listed on the applicable registration page or communication
