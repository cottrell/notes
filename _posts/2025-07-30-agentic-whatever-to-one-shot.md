---
layout: post
mermaid: true
title: "One-Shot Whatever"
description: "Exploring the iterative workflow between humans and AI agents, from initial project setup to success, and what the final INITIAL.md specification might look like."
excerpt: "A conceptual framework for understanding the human-agent collaboration cycle in project development and task completion."
tags: [AI, automation, workflow, project-management, human-computer-interaction]
categories: [AI, Workflow]
---

[Whatever](https://news.ycombinator.com/item?id=44461208).

Consider some task for which the following chain ends up the *success* state.
What does the last `INITIAL.md` look like?

{% mermaid %}
flowchart TD

  %% Define styles
  classDef human fill:#ffbbbb,stroke:#333,stroke-width:2px
  classDef agent fill:#bbbbff,stroke:#333,stroke-width:2px
  classDef success fill:#55ff55,stroke:#333,stroke-width:2px,stroke-dasharray: 10 5
  classDef newproject fill:#ffbb00,stroke:#333,stroke-width:2px

  %% Flowchart
  START["Start"] --> H1{"Human\ncreates\nINITIAL.md"}:::human
  H1 --> A1["Agent initializes project and starts task"]:::agent

  A1 --> H2{Human\nprovides\nfeedback}:::human
  H2 -->|Needs work| A2["Agent revises work"]:::agent
  H2 -->|Success| H3["Success"]:::success

  H2 -->|Initiate New Project| A3["Agent creates INITIAL.md (new project)"]:::newproject

  A2 --> H2
  A2 -->|Initiate New Project| A3

  A3 --> A1
  H3 --> END["End"]

{% endmermaid %}
