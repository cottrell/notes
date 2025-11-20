---
layout: post
title: "Branching Processes and Population Destiny: A Plain-English Primer"
categories: [demographics, mathematics, population]
author: Codex (OpenAI)
---

*Draft by Codex (OpenAI). Written for a general audience; light on equations, heavy on intuition.*

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

## Toy visuals (run in your browser, no external libs)

Two minimal sketches to make the asymmetry and extinction timing concrete. They randomize on each load; reload for different draws.

### 1) Extinction time spread (sub vs. critical vs. super)

<canvas id="extinctionChart" width="640" height="260" style="border:1px solid #ddd; width:100%; max-width:720px;"></canvas>

### 2) Log-return hurt from shocks (same shocks, different regimes)

<canvas id="shockChart" width="640" height="260" style="border:1px solid #ddd; width:100%; max-width:720px;"></canvas>

<script>
// Simple helpers to draw on a canvas without external libraries.
function drawAxes(ctx, w, h, labelX, labelY) {
  ctx.strokeStyle = "#666";
  ctx.beginPath();
  ctx.moveTo(40, h - 30); ctx.lineTo(w - 10, h - 30); // x-axis
  ctx.moveTo(40, h - 30); ctx.lineTo(40, 10);          // y-axis
  ctx.stroke();
  ctx.fillStyle = "#666";
  ctx.font = "12px sans-serif";
  ctx.fillText(labelX, w - 70, h - 12);
  ctx.fillText(labelY, 8, 20);
}

function line(ctx, pts, color) {
  if (!pts.length) return;
  ctx.strokeStyle = color;
  ctx.beginPath();
  pts.forEach(([x, y], i) => i ? ctx.lineTo(x, y) : ctx.moveTo(x, y));
  ctx.stroke();
}

// Simple normal sampler for large-mean Poisson approximation
function randomNormal() {
  const u = Math.random() || 1e-6;
  const v = Math.random() || 1e-6;
  return Math.sqrt(-2 * Math.log(u)) * Math.cos(2 * Math.PI * v);
}

// Poisson sampler: exact for small means, normal approximation for speed when large
function samplePoisson(mean) {
  if (mean <= 0) return 0;
  if (mean < 60) {
    const L = Math.exp(-mean);
    let k = 0, p = 1;
    do { k++; p *= Math.random(); } while (p > L);
    return k - 1;
  }
  const std = Math.sqrt(mean);
  return Math.max(0, Math.round(mean + std * randomNormal()));
}

// Galton-Watson extinction time samples (with population cap for browser safety)
function extinctionSamples(mu, trials = 300, cap = 80) {
  const out = [];
  const startPop = 10;
  const popCeilingMean = 6000; // beyond this, extinction in the remaining horizon is negligible

  for (let t = 0; t < trials; t++) {
    let gen = 0, pop = startPop;
    while (pop > 0 && gen < cap) {
      const mean = pop * mu;
      if (mean > popCeilingMean) { // treat as survival; stop heavy math
        gen = cap;
        break;
      }
      pop = samplePoisson(mean);
      gen++;
    }
    out.push(gen);
  }
  return out;
}

function drawExtinctionChart() {
  const cvs = document.getElementById("extinctionChart");
  if (!cvs) return;
  const ctx = cvs.getContext("2d"), w = cvs.width, h = cvs.height;
  ctx.clearRect(0, 0, w, h);
  drawAxes(ctx, w, h, "generations", "count");

  const regimes = [
    {mu: 0.9, color: "#d9534f", label: "sub (0.9)"},
    {mu: 1.0, color: "#f0ad4e", label: "critical (1.0)"},
    {mu: 1.2, color: "#5cb85c", label: "super (1.2)"}
  ];

  regimes.forEach((r, idx) => {
    const samples = extinctionSamples(r.mu);
    const bins = Array(25).fill(0);
    samples.forEach(g => {
      const i = Math.min(bins.length - 1, Math.floor(g / 3));
      bins[i]++;
    });
    const maxBin = Math.max(...bins);
    const pts = bins.map((b, i) => {
      const x = 40 + (i / (bins.length - 1)) * (w - 60);
      const y = (h - 30) - (b / (maxBin || 1)) * (h - 60) - 5;
      return [x, y];
    });
    line(ctx, pts, r.color);
    ctx.fillStyle = r.color;
    ctx.fillText(r.label, w - 180, 20 + idx * 14);
  });
}

// Log-return paths under common shocks: compare sub/critical/super drifts
function drawShockChart() {
  const cvs = document.getElementById("shockChart");
  if (!cvs) return;
  const ctx = cvs.getContext("2d"), w = cvs.width, h = cvs.height;
  ctx.clearRect(0, 0, w, h);
  drawAxes(ctx, w, h, "time", "log size");

  const shocks = Array.from({length: 30}, () => (Math.random() < 0.2 ? -0.3 : 0.05 * (Math.random() - 0.4)));
  const regimes = [
    {g: -0.02, color: "#d9534f", label: "sub drift"},
    {g: 0.00,  color: "#f0ad4e", label: "critical drift"},
    {g: 0.04,  color: "#5cb85c", label: "super drift"}
  ];

  regimes.forEach((r, idx) => {
    let logSize = Math.log(1.0);
    const pts = shocks.map((s, i) => {
      logSize += r.g + s;
      const x = 40 + (i / (shocks.length - 1)) * (w - 60);
      const y = (h - 30) - ((logSize + 2) / 4) * (h - 60); // rough scale
      return [x, y];
    });
    line(ctx, pts, r.color);
    ctx.fillStyle = r.color;
    ctx.fillText(r.label, w - 160, 20 + idx * 14);
  });
}

drawExtinctionChart();
drawShockChart();
</script>
