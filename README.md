# Open Gov Directory (`open-gov-directory`)

A lightning-fast, SEO-optimized static directory built with Jekyll that maps U.S. states, counties, and municipalities directly to official government public record portals (Tax Assessors, Treasurers, Recorders, and GIS parcel maps).

---

## Project Overview

Navigating local government websites can be tedious. This project aims to provide a clean, centralized index linking citizens, researchers, and real estate professionals directly to official `.gov` resources. 

Because it is powered by **Jekyll**, the entire site compiles into raw static HTML/CSS files, ensuring:
* **Blazing Fast Load Times:** Instant page rendering globally via CDN.
* **Zero Backend Vulnerabilities:** No databases, APIs, or server-side security maintenance required.
* **High SEO Performance:** Pre-rendered markup optimized for long-tail search queries (e.g., *“[County] [State] property tax assessor”*).

---

## Project Structure

```text
open-gov-directory/
├── _data/
│   ├── states.yml          # State-level metadata and slugs
│   └── counties/           # County-specific YAML files (or a master dataset)
│       ├── alabama.yml
│       └── california.yml
├── _layouts/
│   ├── default.html        # Base HTML wrapper with header, footer, and ad slots
│   ├── state.html          # State hub layout listing all counties
│   └── county.html         # Detailed view for a specific county with .gov links
├── _includes/
│   ├── header.html         # Navigation and search bar
│   ├── footer.html         # Disclaimer, copyright, and policy links
│   └── ad-banner.html      # Responsive ad container partial
├── assets/
│   ├── css/                # Stylesheets (Tailwind / Pico.css / Custom)
│   └── js/                 # Client-side search and filtering scripts
├── index.html              # Homepage with state grid and quick search
├── _config.yml             # Jekyll site configuration and plugins
└── README.md
```

---

## Standardized YAML Schema

County and department records use a single schema so each jurisdiction can be added consistently without touching templates.

Primary dataset: `_data/counties.yml`

```yaml
version: 1
schema: county-department-v1
counties:
  - id: ca-los-angeles
    name: Los Angeles County
    slug: los-angeles
    state: California
    state_code: CA
    county_type: county
    departments:
      - type: assessor
        name: Los Angeles County Assessor
        url: https://assessor.lacounty.gov/
        phone: (213) 974-3211
        notes: Property tax assessment and parcel records.
      - type: recorder
        name: Los Angeles County Registrar-Recorder/County Clerk
        url: https://www.lavote.net/
        phone: (800) 815-2666
        notes: Recording and elections services.
```

Reference lookup: `_data/department_types.yml`

```yaml
version: 1
schema: department-type-v1
department_types:
  - key: assessor
    label: Assessor
    description: Property valuation, assessment, and tax roll records.
  - key: recorder
    label: Recorder
    description: Deeds, recording, and land title records.
```

This structure keeps the county record stable while allowing each department to be normalized by `type`, `name`, `url`, and optional `phone` and `notes` metadata.

---

## Local Development Setup

Follow these steps to run the project locally on your machine:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/open-gov-directory.git
   cd open-gov-directory
   ```

2. **Install Ruby and Bundler** (if not already installed).

3. **Install dependencies:**
   ```bash
   bundle install
   ```

4. **Run the local Jekyll server:**
   ```bash
   bundle exec jekyll serve
   ```

5. Open your browser and navigate to `http://localhost:4000`.

---

## Deployment

This site is configured for zero-cost, automated deployment via modern static hosting providers (such as **Cloudflare Pages** or **Netlify**):

1. Push your repository to GitHub.
2. Link your GitHub repo to Cloudflare Pages or Netlify.
3. Set the build command to: `bundle exec jekyll build`
4. Set the publish directory to: `_site`

The `jekyll-sitemap` plugin generates `_site/sitemap.xml` during each build. It is supported by GitHub Pages and can be used with Cloudflare Pages and Netlify through the Bundler-based build command above.

---

## Disclaimer

*The data and links presented on this site are gathered from public government sources. This project is a directory index and makes no warranties regarding the accuracy, completeness, or up-to-date status of external government websites. This content is not legal or professional title advice.*

---

## License

Distributed under the MIT License. See `LICENSE` for more information.
