---
layout: post
title: Predictability Frontier
date: 2026-06-11
mermaid: true
---

AI detectors identify generated text because LLMs tend to generate near-argmax paths through a sequence space. To bypass detection without losing coherence, could we treat writing as a structural projection of a concept graph rather than a token-level optimization?

### The Mechanics of Detection

Existing detectors rely on two main methodologies:
1. **Curvature Tests (e.g., DetectGPT)**: Machine-generated text sits near a local maximum of the reference model’s log-likelihood surface. If you perturb the tokens, likelihood drops sharply. Human text sits in flatter, less predictable regions.
2. **Supervised Classifiers**: Ensembles (like RoBERTa) trained on large human vs. machine datasets. They are highly vulnerable to distribution shifts and light paraphrasing.

The underlying limit is sample complexity (Chakraborty et al.): as the generator's distribution approaches the human distribution, the likelihood ratio goes to 1, and detection power collapses for any fixed sample length.

### The Hypothesis: Graph Projection

But human text is not simply high-perplexity (flat likelihood); it is high-perplexity *relative to a base model* because human writers possess a massive, unobservable latent state—a Directed Acyclic Graph (DAG) $G = (V, E)$ of concepts and logical dependencies.

Translating this graph into a 1D sequence requires:
1. **Topological Routing**: Ordering the claims. This is a choice of 1 out of a valid subset of $K!$ topological sorts.
2. **Lexical Mapping**: For each node and edge, choosing a natural language expression from $N_i$ alternatives.

The total representation space $S$ is combinatorially large:
$$|S| \propto |TopologicalSorts| \times \prod_{i=1}^{K} N_i$$

An LLM generating text token-by-token defaults to local argmax choices. Even with temperature sampling, it stays close to a low-entropy backbone. Bumping temperature shifts selection to the tails, but it does so uniformly and without structural correlation—injecting token-level noise rather than semantic variation, pushing the text off the coherence manifold.

{% mermaid %}
graph TD
    subgraph Conceptual Space
        G[Concept Graph DAG]
    end
    subgraph 1D Sequence Projection
        G -->|Topological Sort| O[1 of K! Claim Orders]
        O -->|Lexical Mapping| L[1 of N_i Phrasings]
    end
    L -->|Standard LLM| Argmax[Argmax Path / Predictable]
    L -->|High Temp| Noise[Tail Tokens / Incoherent]
    L -->|Structural Routing| Jump[Graph-guided Jumps / Coherent & High Perplexity?]
{% endmermaid %}

### The Question: Is Dimensionality a Shield?

If a generator makes structured, correlated jumps across $S$—explicitly varying the order of claims and phrasing structural connections differently while maintaining the underlying DAG invariants—can a 1D token-level detector identify it?

Under a curvature test like DetectGPT, a structurally-routed sequence shouldn't sit at a simple local maximum of the base model's likelihood surface. Because the base model lacks the latent DAG, the sequence appears as a series of low-probability transitions that are nonetheless semantically coherent. 

The detector faces a severe dimensionality mismatch. If the generator is routing the graph explicitly, the number of valid representations scales too fast for standard adversarial training to bound.

### Open Problems

1. **Information Leakage**: Does topological sorting itself have detectable statistical signatures? Even if we vary the path, the transitional phrases used to connect node $A$ to node $B$ might still cluster around predictable LLM patterns.
2. **Reconstructing the Latent Graph**: Can a sufficiently large detector implicitly reconstruct the latent DAG and recognize that the sequence is a perfect, clean mapping of a synthetic graph rather than messy human thought?
3. **Verification**: How do we measure the actual volume of the reachable representation space for a simple concept graph?
