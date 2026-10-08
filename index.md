---
layout: default
title: Home
---

<div class="bg-slate-100/70">
  <div class="mx-auto max-w-6xl px-5 py-12 md:py-16">
    <div class="mx-auto max-w-3xl text-center">
      <div class="mb-4 inline-flex items-center gap-2 rounded-full border border-slate-200 bg-white px-3 py-1 text-[11px] font-semibold uppercase tracking-[0.18em] text-slate-500">
        <span class="inline-block h-2 w-2 rounded-full bg-emerald-500"></span>
        Public access, made simpler
      </div>
      <h1 class="text-4xl font-black tracking-tight text-slate-800 md:text-6xl">U.S. Public Records Hub</h1>
      <p class="mx-auto mt-4 max-w-2xl text-lg text-slate-600">
        Find official state and local agency portals for property records, recorded documents, and tax information.
      </p>

      <div class="mx-auto mt-8 max-w-2xl">
        {% include search-box.html id="home-directory-search" %}
      </div>

      <div class="mt-3 text-center text-xs text-slate-500">
        Popular: <a href="{{ '/states/california/' | relative_url }}" class="text-emerald-700 hover:underline">California</a> • <a href="{{ '/states/california/' | relative_url }}" class="text-emerald-700 hover:underline">Los Angeles County</a>
      </div>
    </div>
  </div>
</div>

<div class="mx-auto max-w-6xl px-5 py-10">
  <div class="mb-8 flex items-end justify-between gap-4">
    <div>
      <h2 class="text-3xl font-black tracking-tight text-slate-800">Explore by State</h2>
      <p class="mt-2 text-slate-600">Start with a state to find county and municipal records.</p>
    </div>
    <a href="{{ '/all-jurisdictions/' | relative_url }}" class="hidden rounded-full border border-slate-300 bg-white px-4 py-2 text-sm font-medium text-slate-600 shadow-sm md:inline-flex">View all</a>
  </div>

  <div class="grid gap-4 md:grid-cols-3 xl:grid-cols-6">
    {% assign states = site.data.states.states | sort: 'name' %}
    {% for state in states %}
    <a href="{{ '/states/' | relative_url }}{{ state.slug }}/" class="rounded-xl border border-slate-200 bg-white p-4 text-center shadow-sm transition hover:-translate-y-0.5 hover:shadow-md">
      <div class="text-2xl font-black tracking-tight text-slate-800">{{ state.code }}</div>
      <div class="mt-2 text-sm text-slate-500">{{ state.name }}</div>
    </a>
    {% endfor %}
  </div>

  <div class="mt-12 grid gap-8 lg:grid-cols-[minmax(0,2.3fr)_320px]">
    <section>
      <h3 class="mb-5 text-3xl font-black tracking-tight text-slate-800">Recently Verified Portals</h3>

      <div class="space-y-4">
        {% assign sample_ports = "Los Angeles County Assessor|Cook County Recorder of Deeds|Maricopa County Treasurer" | split: '|' %}
        {% for portal in sample_ports %}
        <article class="flex items-start justify-between gap-4 rounded-xl border border-slate-200 bg-white p-4 shadow-sm">
          <div class="flex items-start gap-3">
            <div class="mt-1 flex h-9 w-9 items-center justify-center rounded-md border border-slate-200 bg-slate-50 text-slate-600">
              <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" viewBox="0 0 20 20" fill="currentColor">
                <path d="M4 3a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V5a2 2 0 00-2-2H4zm1.5 2.5h9a.5.5 0 010 1h-9a.5.5 0 010-1zm0 3h9a.5.5 0 010 1h-9a.5.5 0 010-1zm0 3h6a.5.5 0 010 1h-6a.5.5 0 010-1z" />
              </svg>
            </div>
            <div>
              <h4 class="text-xl font-semibold text-slate-800">{{ portal }}</h4>
              <p class="mt-1 text-sm text-slate-500">{{ portal | split: ' ' | slice: 0, 4 | join: ' ' }} • Property assessment</p>
              <p class="mt-2 break-all text-sm text-slate-400">example.gov</p>
            </div>
          </div>
          <div class="mt-1 inline-flex items-center gap-2 rounded-full border border-emerald-200 bg-emerald-50 px-2.5 py-1 text-xs font-medium text-emerald-700">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-3.5 w-3.5" viewBox="0 0 20 20" fill="currentColor"><path fill-rule="evenodd" d="M16.704 4.296a1 1 0 010 1.414l-7.071 7.071a1 1 0 01-1.414 0L3.296 9.81a1 1 0 111.414-1.414l4.243 4.243 6.364-6.364a1 1 0 011.414 0z" clip-rule="evenodd" /></svg>
            Verified Sep 30, 2026
          </div>
        </article>
        {% endfor %}
      </div>

      <p class="mt-6 text-sm text-slate-500">Verification checks the defintion link, not the contents of agency records.</p>
    </section>

    <aside class="space-y-5">
      <div class="rounded-xl border border-slate-200 bg-white p-5 shadow-sm">
        <div class="mb-4 text-center text-[10px] font-semibold uppercase tracking-[0.2em] text-slate-400">Advertisement</div>
        <div class="flex min-h-[180px] items-center justify-center rounded-lg border border-dashed border-slate-200 bg-slate-50 text-sm text-slate-400">Display ad space</div>
      </div>

      <div class="rounded-xl border border-emerald-200 bg-emerald-50 p-5 shadow-sm">
        <div class="flex items-center gap-3 text-emerald-800">
          <span class="inline-flex h-8 w-8 items-center justify-center rounded-md bg-emerald-100">✓</span>
          <p class="text-lg font-semibold">A clear path to the source</p>
        </div>
        <p class="mt-3 text-sm leading-6 text-emerald-800/80">
          We organize links to official agency websites. Your request records directly from the agency, not from this directory.
        </p>
      </div>
    </aside>
  </div>
</div>
