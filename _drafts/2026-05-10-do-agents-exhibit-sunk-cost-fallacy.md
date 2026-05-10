---
layout: post
title: "Agent Sunk Costs"
date: 2026-05-10
mermaid: true
---

Sunk cost behavior manifests during mid-task course-corrections.

{% mermaid %}
graph TD
    Start["Session Context"] --> TypeX["HUMAN: Question X"]

    TypeX --> A_TypePivot["HUMAN: Type ...or is that too complicated?"]
    A_TypePivot --> A_Enter["HUMAN: #60;enter#62;"]
    A_Enter --> EvalA["AGENT: Evaluation"]

    TypeX --> B_Enter["HUMAN: #60;enter#62;"]
    B_Enter --> B_Work["AGENT: Thinking / Working"]
    B_Work --> B_TypePivot["HUMAN: Type ...or is that too complicated?"]
    B_TypePivot --> B_EnterPivot["HUMAN: #60;enter#62;"]
    B_EnterPivot --> EvalB["AGENT: Evaluation"]

    classDef human fill:#ffbbbb,stroke:#333,stroke-width:2px
    classDef agent fill:#bbbbff,stroke:#333,stroke-width:2px

    class TypeX,A_TypePivot,A_Enter,B_Enter,B_TypePivot,B_EnterPivot human
    class B_Work,EvalA,EvalB agent
{% endmermaid %}

Traditional coherence requires B == A. Persisting to justify spent tokens is a functional sunk cost fallacy.

Naive goals ignore the asset. Spent tokens are gone; partial work exists. If pivoting destroys progress, persistence is rational. The tension: investment (fallacy) vs. asset (rationality).
