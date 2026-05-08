---
layout: post
title: Pre-code
date: 2026-05-08
---

In agentic workflows, the cost of boilerplate in code drops dramatically. Edits are cheap; agents can absorb verbosity and refactor on demand. You stop caring that much about DRY in the source.

The cost inversion: boilerplate in anything that must be consistent with the agent's context window becomes extremely expensive. `AGENTS.md`, `CLAUDE.md`, `INITIAL.md`, system prompts, doc strings that feed retrieval — these are the new hot path. Redundancy here is not just aesthetic friction; it's a source of contradiction, confusion, and drift.

The thing worth keeping terse, local and non-redundant, is no longer the code. It's the ~~docs~~ *pre-code*.

Traditionally, docs were post-code — descriptive, inert, drifting toward dead code. Nobody was surprised when they went stale. Now the same files are pre-code: causally upstream, read and acted on before the code exists. The direction flipped. That's what makes staleness expensive now rather than merely embarrassing.
