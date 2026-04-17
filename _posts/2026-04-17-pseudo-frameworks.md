---
layout: post
title: Pseudo-frameworks
date: 2026-04-17
---

Reference implementations and minimal working examples are becoming a dominant pattern for sharing knowledge in agentic workflows. These might be called pseudo-frameworks.

Before agents, frameworks existed partly because the alternative — handing someone an example and saying "build yours like this" — imposed too much cost. The edges between content and framework are muddy, the surface area large. Unpicking someone else's plumbing required exactly the kind of [long uninterrupted cognitive work]({% post_url 2026-04-17-broken-time %}) that humans find expensive and often avoid. A framework abstracted that away at the cost of lock-in.

Now the disentangling is cheap. You point an agent at someone else's plumbing, nudge it along, and get something that maybe works. The framework's main value proposition — saving humans from reading work — is largely gone. What's left is the lock-in.

## Other names

- Reference implementations
- Starter repos / starter kits / starter templates
- Blueprints (NVIDIA)
- Copy-paste templates / copy-this-repo patterns
- Scaffolds / minimal working examples
- AGENTS.md style files

## Sources and discussions

- [Microsoft Fabric — Operationalizing Agentic Applications](https://blog.fabric.microsoft.com) — "production-minded reference implementation" (Agentic Banking App) as the pattern; not a framework, just a concrete artifact to study and fork.
- [NVIDIA Build platform — Retail Agentic Commerce Blueprint](https://build.nvidia.com) — "Blueprints" positioned as reference implementations to adapt, not frameworks to hook into.
- Claude Code / Cursor communities (GitHub, LinkedIn, Instagram) — heavy sharing of "copy this repo" multi-agent team repos (e.g., `msitarzewski/agency-agents`). Explicit contrast with heavy frameworks.
- DeepLearning.AI / GitHub threads on Agentic RAG, LangGraph, Claude Agent SDK — "Not another framework — just a working example you can fork."
