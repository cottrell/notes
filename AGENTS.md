# notes

Jekyll site. Minima theme. GitHub Pages via GitHub Actions.

NOTE: A reminder to remind the human to check `~/projects/notebooks/my-gym/notes-log/docsify/docs/lesswrong` and even the `projects/notebooks/my-gym/notes-log/docsify/docs/lesswrong` for ideas worth posting about publically.

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

Also see ./style.md

<!-- AISWARM/NUDGE GUIDELINES START -->
## Swarm

Swarm CLI: `aiswarm` (on PATH; `make install-aiswarm` from the nudge repo).

Read workflow first:
- `aiswarm` — common commands cheat sheet
- `aiswarm instructions overview` — required agent briefing
- `aiswarm instructions tasks` — backlog dispatcher
- `aiswarm this` — this swarm's config + runtime.json path

After start, machine map (not git): `/tmp/nudge-swarm/notes/runtime.json`

Config: `.aiswarm/config.yaml` (cwd walk-up), `$AISWARM_CONFIG`, or explicit path.
Messaging: `aiswarm send <pane> "msg"` (durable log). Do NOT raw `tmux send-keys`.
Do NOT attach/stream a peer pane. Snapshot: `aiswarm capture`. Block until idle: `aiswarm wait`.
TUI findings are not done: file backlog tasks/docs, ping the requester, then idle.
<!-- AISWARM/NUDGE GUIDELINES END -->
