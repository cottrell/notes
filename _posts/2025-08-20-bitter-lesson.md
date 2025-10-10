---
layout: post
title: The Bitter Lesson
date: 2025-08-20
---

What was the bitter lesson actually about? It was originally about features and
how hand crafted features were inferior to general approaches using more
compute, data and scaling.

But really this was conflating a few things:
* restricting the hypothesis space by using a subset of features will result in poorer performance (assuming the regularization effects of the restriction are not important)
* having features that are adaptive (receive feedback from the training tasks) will always be better than having fixed features, again assuming we are not using the fixed-ness as a kind of regularizer.

Was the bitter lesson ever cogent?

... some session with GPT leads to:

> Right — and that’s where Sutton’s “lesson” stops being a clean principle and becomes a **strategic bet** about research effort.
>
> Two costs exist:
>
> 1. **Meta-learning cost (general approach):**
>
>    * You need a broad architecture, training infrastructure, and often huge data/compute budgets.
>    * Bootstrapping this (e.g. foundation model pretraining) is very expensive.
>    * But once built, it amortizes across many tasks: the hypothesis class is vast and adaptive.
>
> 2. **Case-specific engineering cost (hand features):**
>
>    * You encode inductive bias for *this* task only.
>    * Setup is cheaper, requires less compute, and gives immediate payoff.
>    * But it caps performance, and doesn’t transfer well.
>
> So the “bitter lesson” deliberately **ignores the engineering economics**: it assumes the asymptotic regime, where amortized cost of general approaches is spread across tasks and where compute is cheap relative to human labor.
>
> In reality the tradeoff is:
>
> $$
> \text{Total Cost} = \text{Human Design Effort} + \text{Compute/Data Cost}
> $$
>
> and the choice is which term dominates under your constraints.
>
> * In 1970s chess: compute was scarce, so hand features made sense.
> * In 2010s deep learning: compute scaled faster than human-design capacity, so general methods overtook.
>
> ---
>
> 👉 So a cogent reformulation is:
>
> * Hand-crafted features = low setup cost, bounded performance.
> * General scalable methods = high setup cost (meta-learning infra), but asymptotically superior and transferable.
>
> The “lesson” was Sutton’s claim that the latter dominates in the long run because compute keeps getting cheaper, while human design doesn’t scale.
>
> ---
>
> Do you want me to make this **explicit as an optimization tradeoff** (minimizing total cost subject to a performance threshold)? That would formalize exactly *when* the “bitter lesson” applies.
