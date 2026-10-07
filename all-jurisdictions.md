---
layout: default
title: All jurisdictions
---

<div class="mx-auto max-w-6xl px-5 py-10 md:py-12">
  <div class="mb-8">
    <div class="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-white px-3 py-1 text-[11px] font-semibold uppercase tracking-[0.18em] text-slate-500">
      <span class="inline-block h-2 w-2 rounded-full bg-emerald-500"></span>
      State index
    </div>
    <h1 class="mt-4 text-4xl font-black tracking-tight text-slate-800 md:text-5xl">All jurisdictions</h1>
    <p class="mt-3 max-w-2xl text-lg text-slate-600">
      Browse every configured state in the directory and jump directly to a county record page.
    </p>
  </div>

  <div class="grid gap-3 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-5 xl:grid-cols-6 2xl:grid-cols-6">
    {% assign states = site.data.states.states | sort: 'name' %}
    {% for state in states %}
      {% assign county_count = site.data.counties.counties | where: 'state_code', state.code | size %}
      <a href="{{ '/states/' | relative_url }}{{ state.slug }}/" class="rounded-xl border border-slate-200 bg-white p-3 text-center shadow-sm transition hover:-translate-y-0.5 hover:shadow-md">
        <div class="text-xl font-black tracking-tight text-slate-800">{{ state.code }}</div>
        <div class="mt-2 text-xs font-medium text-slate-700">{{ state.name }}</div>
        <div class="mt-1 text-[10px] uppercase tracking-wide text-slate-500">{{ county_count }} counties</div>
      </a>
    {% endfor %}
  </div>
</div>
