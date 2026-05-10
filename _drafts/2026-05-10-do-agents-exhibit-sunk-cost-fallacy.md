---
layout: post
title: "Agent Sunk Costs"
date: 2026-05-10
mermaid: true
---

Sunk cost behavior in agents manifests during mid-task human course-corrections.

{% mermaid %}
graph TD
    Start["Session Context"] --> TypeX["HUMAN: Question X"]

    TypeX --> A_TypePivot["HUMAN: ...or is that too complicated?"]
    A_TypePivot --> A_Enter["HUMAN: #60;enter#62;"]
    A_Enter --> EvalA["AGENT: Evaluation"]

    TypeX --> B_Enter["HUMAN: #60;enter#62;"]
    B_Enter --> B_Work["AGENT: Thinking / Working"]
    B_Work --> B_TypePivot["HUMAN: ...or is that too complicated?"]
    B_TypePivot --> B_EnterPivot["HUMAN: #60;enter#62;"]
    B_EnterPivot --> EvalB["AGENT: Evaluation"]

    classDef human fill:#ffbbbb,stroke:#333,stroke-width:2px
    classDef agent fill:#bbbbff,stroke:#333,stroke-width:2px

    class TypeX,A_TypePivot,A_Enter,B_Enter,B_TypePivot,B_EnterPivot human
    class B_Work,EvalA,EvalB agent
{% endmermaid %}

Traditional coherence requirements suggest Scenario B should be evaluated identically to Scenario A. If the agent’s response in B is biased toward persisting with the initial path to justify spent tokens, it exhibits a functional sunk cost fallacy.

However, the "fallacy" label assumes a naive objective interpretation of the goal. From the agent's perspective, the tokens are already spent and the work is partially complete. If the partially completed work has positive value that would be lost by pivoting, then persisting is a rational economic choice, not a bias. The tension lies in whether the agent is protecting the *investment* (fallacy) or the *asset* created by that investment (rationality).
