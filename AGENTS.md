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


## Swarm

Swarm workflow: read first:
- Runtime map: `/tmp/nudge-swarm/notes/runtime.json`
- Self-awareness note: `/tmp/nudge-swarm/notes/self-awareness.txt`

Use as source of truth for:
- tmux pane targets
- monitor sockets, live state
- babysit pid/log/spec/state files

Messaging another tmux pane: ALWAYS use `tmux-send`.
Do NOT use raw `tmux send-keys ... Enter`.

Required form:
- `/home/cottrell/dev/nudge/tmux-send <target> "message"`

Reason:
- raw `tmux send-keys ... Enter` often fails to submit Enter
- prompts can sit unexecuted until next nudge or manual Enter

Swarm scripts: `/home/cottrell/dev/nudge/swarm`.

<!-- BACKLOG.MD GUIDELINES START -->
<!-- backlog.md-instructions-version: 1.51.0 -->
<CRITICAL_INSTRUCTION>

## Backlog.md Workflow

This project uses Backlog.md for task and project management.

**At the beginning of each conversation in this project, run `backlog instructions overview` before answering or taking action. Re-read it only if you have not read it yet in the current conversation.**

Use the overview to decide whether to search, read, create, or update Backlog tasks.

Before task lifecycle actions, read the matching detailed guide:
- `backlog instructions task-creation` before creating or splitting tasks
- `backlog instructions task-execution` before planning, changing status or assignee, adding a plan or implementation notes, or implementing task work
- `backlog instructions task-finalization` before checking acceptance criteria, writing final summaries, or moving tasks to terminal statuses

Use `backlog <command> --help` before running unfamiliar commands. Help shows options, fields, and examples.

Do not edit Backlog task, draft, document, decision, or milestone markdown files directly. Use the `backlog` CLI so metadata, relationships, and history stay consistent.

</CRITICAL_INSTRUCTION>
<!-- BACKLOG.MD GUIDELINES END -->
