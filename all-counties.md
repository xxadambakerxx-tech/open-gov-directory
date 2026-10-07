---
layout: default
title: All counties
---

<div class="mx-auto max-w-6xl px-5 py-10 md:py-12">
  <div class="mb-8">
    <div class="inline-flex items-center gap-2 rounded-full border border-slate-200 bg-white px-3 py-1 text-[11px] font-semibold uppercase tracking-[0.18em] text-slate-500">
      <span class="inline-block h-2 w-2 rounded-full bg-emerald-500"></span>
      County index
    </div>
    <h1 class="mt-4 text-4xl font-black tracking-tight text-slate-800 md:text-5xl">All counties</h1>
    <p class="mt-3 max-w-2xl text-lg text-slate-600">
      Browse every configured county in the directory and jump directly to its official agency portal list.
    </p>
  </div>

  <div class="grid gap-3 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5 2xl:grid-cols-6">
    {% assign counties = site.data.counties.counties | sort: 'state_code' %}
    {% for county in counties %}
      {% assign department_count = county.departments | size %}
      <a href="{{ '/counties/' | relative_url }}{{ county.slug }}/" class="rounded-xl border border-slate-200 bg-white p-3 text-center shadow-sm transition hover:-translate-y-0.5 hover:shadow-md">
        <div class="text-xl font-black tracking-tight text-slate-800">{{ county.state_code }}-{{ county.name }}</div>
        <div class="mt-2 text-[10px] uppercase tracking-wide text-slate-500">{{ department_count }} department portals</div>
      </a>
    {% endfor %}
  </div>
</div>
