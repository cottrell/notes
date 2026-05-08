# notes

Jekyll site. Minima theme. GitHub Pages via GitHub Actions.

## Setup

- `make dev` to serve locally on `http://bleepblop:4100`
- Posts in `_posts/YYYY-MM-DD-title.md`, drafts in `_drafts/`
- Front matter minimum: `layout: post`, `title:`, `date:`
- Optional front matter: `mermaid: true` (enables mermaid diagrams), `mathjax` is on globally

## GitHub Pages note

In repo settings → Pages → Build and deployment: select "GitHub Actions" (not the legacy default). Required for plugins to work.

## Post style

- Short, direct prose. No padding.
- Conceptual observations — state the idea, not the motivation for stating it.
- First sentence carries the claim. No throat-clearing.
- Headers only when the post has genuinely distinct sections.
- No bullet points unless listing is the point.
- Terse titles (2–3 words preferred).
- Markdown, mermaid diagrams, and MathJax all supported.
