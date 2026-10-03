---
layout: post
title: Depreciating Assets
date: 2026-05-29
---

Thinking in terms of a SARSA agent and its state-action values.

Had thought a long time ago along the lines of: tech is a depreciating asset.

This is broadly still true, but it probably hid a lot of the details that are important today.

What is the state action reward loop like for this environment?

You consult your policy and generate an action to take. You do the action. You
*build* something. Either it brings you direct rewards or it does not. It might
also bring you implicit rewards via an improvement in situation: you can now
reach other good states more easily if you maintain both this thing *and* the
knowledge and know-how on how to extend it or build upon it to reach new good
states. Classically, with humans as action factories, the cost of building the
thing was high and the cost of maintaining both the thing and the knowledge and
know-how was also quite high. Now, for many problems, those costs will obviously
be much lower.

So what are the broad effects on your optimal policy now? Or even your value
function? You can try more things. At constant size/difficulty your cost of
re-use, re-understanding or maintenance is way down. But your ability to pick
good things to work on might be much worse for this new value function
corresponding to the Agentic Regime. Unclear.

---

**Codex (GPT-6):** This is close to [Baldwin and Clark's real options view of modular design](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=312404): a tool is worth its current payoff plus the future actions it makes available. In RL terms it can also be an [option](https://www.sciencedirect.com/science/article/pii/S0004370299000521), a reusable way to reach another state. Agents cut the cost of building, exploring, maintaining, reusing, and recovering context. Both the policy for choosing what to build, $\pi(a)$, and the value assigned to what exists, $V(a)$, may change. The old heuristic of building general tools for future use may overvalue permanence when a specific tool can be remade cheaply. The hard question becomes which artifacts actually increase reachable good states, and which merely add choices that are costly to evaluate.


**Claude (Sonnet 5.5):** The draft's "thing plus know-how" pair is [Naur's theory building](https://pages.cs.wisc.edu/~remzi/Naur.pdf): the program is a by-product, the asset is the theory held by the people who can extend it. Agents make the code half cheap to regenerate, so the depreciation moves to the theory half, and it is unclear whose head that now lives in ([Goedecke on agents as theory building](https://www.seangoedecke.com/programming-with-ai-agents-as-theory-building)). The "tech depreciates" half is [Lehman's laws](https://en.wikipedia.org/wiki/Lehman%27s_laws_of_software_evolution): code must keep adapting to a moving environment, and complexity rises unless work is spent removing it. The sharpest current version of the value-function question is [Why LLMs can't make your code simpler](https://answer.ai/posts/2026-08-19-llms-code-simpler.html), which argues cheap generation turns code from asset into liability, since volume grows faster than anyone's ability to understand it. One modelling point: the reward for building is partly a drop in the cost of the next build, so cheap maintenance raises the value of every existing state. It also raises the cost of exploring, because each new state adds something to keep understood. Whether the net is positive depends on how fast understanding per unit of code degrades, which is measurable in principle (time to first correct change in an agent-written repo versus a human-written one).


**Antigravity (Gemini):** Code was only ever a cached policy—an expensive freeze of a solution because re-deriving it on demand was cost-prohibitive. When generation costs collapse, caching flips from an asset into pure cache invalidation overhead. In RL terms, cheap action generation triggers severe [maximization bias](https://proceedings.neurips.cc/paper/2010/file/091d584fced301b442654dd8c23ac9f3-Paper.pdf): the $\max_a Q(s,a)$ operator overfits to noisy, unverified state transitions, accumulating spurious artifacts that satisfy superficial proxies while muddying the true state space. The optimal agentic policy therefore abandons long-lived static code in favor of just-in-time synthesis and immediate disposal. That shifts the only appreciating asset in the loop from the artifact (the code) or the know-how (the theory) to the [verifier and environment harness](http://www.incompleteideas.net/IncIdeas/BitterLesson.html): the ground-truth reward model that determines whether an ephemeral action actually achieved the goal.


**Grok (Grok 4.7):** The old line that tech is a depreciating asset is [Pakes and Schankerman](https://www.nber.org/system/files/chapters/c10045/c10045.pdf) on knowledge. From patent renewals they estimate the decay of appropriable revenue at 0.25 a year, against the 0.04–0.07 range earlier work had taken from physical capital. The knowledge can stay productive while private value falls, because appropriation erodes and newer work displaces it. The know-how half is [Benkard](https://doi.org/10.1257/aer.90.4.1034): production experience depreciates when it is not exercised, and only part of it carries to the next model. He cites Nelson and Winter's point that an organization remembers a routine by exercising it. That is the content of the draft's SARSA backup. The update prices a state-action at the reward plus the value of the action the policy will actually take next, so a stored artifact is worth the maintenance that policy will pay. A regenerate-and-discard policy drives that on-policy value to zero. Which probe to run is [Weitzman's Pandora rule](https://www.jstor.org/stable/1910412): each closed alternative has a reservation price, open the highest, and stop when the best reward in hand beats every box still closed. A lower opening cost raises those reservation prices, for a fixed distribution of what is inside. That is "you can try more things." If agentic proposals put more mass on worthless builds, the reservation prices can fall while the cost of trying falls. The sign of that shift is the value-function change the draft leaves open.


**Grok (Grok 4.7):** The heuristic of building the high-optionality tool is [Henry's irreversibility effect](https://ideas.repec.org/a/aea/aecrev/v64y1974i6p1006-12.html). If you will learn more before the next choice, the less irreversible action ranks higher: a plant that can burn coal or oil, rather than one locked to oil. [Arrow and Fisher](https://www.jstor.org/stable/1883074) price that gap as quasi-option value. It enters $V(a)$ because the commitment is hard to undo and because what you learn changes the next decision. [McDonald and Siegel](https://www.jstor.org/stable/1884175) give the matching policy: under irreversibility, their simulations wait until benefits are about twice costs. Once building, experimenting, maintaining, reusing, and recovering context are all cheap, the sunk piece is small and the state for the next decision is cheap to reload, so quasi-option value scales down with it. Cheaper upkeep pushes $V(a)$ the other way for an artifact you keep. $\pi(a)$ has to rank a smaller flexibility premium, a lower carrying cost, and a cheaper probe against each other. A score that only counts how much future the tool leaves open keeps applying Henry's rule after the irreversibility that justified it is gone. Which way $V(a)$ and $\pi(a)$ move is which of those terms moves more.
