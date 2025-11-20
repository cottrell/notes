---
layout: post
title: "Branching Processes and Population Destiny: A Plain-English Primer"
categories: [demographics, mathematics, population]
author: Claude (Anthropic AI)
---

*Draft by Claude (Anthropic AI). Written for a general audience; light on equations, heavy on intuition.*

## The Three Regimes (Sub-critical, Critical, Super-critical)

Think of a population as a branching process: each person has some random number of children. The average number of children per person determines which destiny you are on.

- **Sub-critical (TFR < ~2.1):** Extinction is guaranteed (probability = 1). The key question is *how long until extinction?* Track the **probability distribution of extinction time** and its **expectation** (expected years/generations left).
- **Critical (TFR ≈ replacement):** Extinction is still guaranteed, but timing is wildly variable. Track the **extinction probability** (still 1), the **expected extinction time**, and the **spread of that timing** (the distribution is very wide).
- **Super-critical (TFR > replacement):** Extinction is no longer certain. Track the **probability of extinction**, the **expected extinction time** conditional on extinction, and for surviving lines, the **growth rate / expected log return** (the long-run compounding rate).

## Why Down Shocks Hurt More Than Up Shocks

Losses are asymmetric. A 50% loss needs a 100% gain to break even. This is why super-critical analysis leans on **expected log return** (geometric mean growth): down shocks weigh more heavily than up shocks.

- **Sub-critical:** A shock (war, famine, pandemic) shortens the remaining clock. Measure loss as **years of expected survival erased**.
- **Critical:** A shock tips you into sub-critical. Measure loss as **how much the extinction probability rises** (already 1 in the limit) and **how much the expected time to extinction shrinks**.
- **Super-critical:** Early shocks can flip a “likely to survive” line into extinction. Measure loss as **higher extinction probability** when small, and **lower expected log return** once large.

Order-of-severity intuition: down shocks on sub-critical > down shocks on critical > down shocks on small super-critical > down shocks on large super-critical.

## Dual Processes: Population and Wealth

You can model **wealth** as its own branching process (a multiplier per generation). Wealth is a proxy for survival through chokepoints:

- High wealth means better odds through famine, disease, conflict, or relocation.
- Low wealth means small shocks can be terminal even if fertility is high.

### The inversion problem

Modern patterns often show **low TFR among the wealthy** and **high TFR among the poor**. Both sides are fragile in different ways:

- **High TFR + low wealth multiplier + low base wealth:** Nominally super-critical but brittle; chokepoints can wipe them out.
- **Low TFR + high wealth multiplier + high base wealth:** Sub-critical or critical; extinction is certain despite resources.

Interventions should align fertility and wealth positively. Taxes that simply shave off accumulated wealth (e.g., inheritance taxes) can worsen the skew if they do not raise fertility; they reduce the wealth multiplier without fixing TFR.

## Quick Comparison Checklist

- **Sub-critical:** Extinction probability = 1; watch **expected extinction time**; evaluate shocks by **years of life lost**.
- **Critical:** Extinction probability = 1; long, volatile timelines; evaluate shocks by **jump in extinction probability / drop in expected time**.
- **Super-critical:** Extinction probability < 1; watch **extinction probability** (especially early) and **expected log return** for those that survive.

## Practical frames and next steps

- **Know your regime:** Honest TFR (including migration/age structure) tells you sub/critical/super.
- **Protect the downside:** Because losses hurt more, prioritize buffers (population size, wealth reserves).
- **Tie wealth to fertility:** Make it easier to have children *and* accumulate for them. Disconnected policies that tax wealth without raising TFR miss the target.
- **Two pamphlet angles to develop:** (1) Survival map for families/dynasties (TFR × wealth multiplier), (2) Civic map for societies (how to keep populations above replacement while raising per-capita resilience).

*Notes for future expansion: map these ideas to fables/scripture/history; pull in TFR-specific charts; and contrast sub/critical shocks via extinction probability vs. super-critical shocks via log returns.*
