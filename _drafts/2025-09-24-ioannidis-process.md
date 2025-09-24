---
layout: post
title: "The Ionnidis Process"
date: 2025-09-24
categories: [research, methodology, bias]
mermaid: true
---

# The Ioannidis Process

See [Why Most Published Research Findings Are False](https://journals.plos.org/plosmedicine/article?id=10.1371/journal.pmed.0020124#s2).

Ionnidis et al discuss how different kinds of errors and bias ("interests")
propagate without really offering a simple version of the
mechanics of the publication generation process.

I think we might call this missing view the qualitative picture or the high level causal graph.

{% mermaid %}
graph LR
    I[Incentives] -.-> T{Pick Topic}
    T --> W((Investigate))
    W --> D1{Publish?}
    D1 -->|Yes| P((Publish))
    D1 -->|No| H((Censor))

    P --> D2{Continue?}
    H --> D2

    D2 -->|Yes| W

    I -.-> W
    I -.-> D1
    I -.-> D2

    %% Causal link styling
    linkStyle 0 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 7 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 8 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 9 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5

    %% Legend
    subgraph Legend[" "]
        L1[" "] -->|Process Flow| L2[" "]
        L3[" "] -.->|Causal Influence| L4[" "]
    end

    %% Styling
    classDef process fill:#e8f4f8
    classDef decision fill:#fff2cc
    classDef outcome fill:#d4edda
    classDef legend fill:#f9f9f9,stroke:#ccc
    classDef broadcast fill:#d4edda,stroke:#28a745,stroke-width:5px
    classDef censor fill:#d4edda,stroke:#dc3545,stroke-width:5px

    class I process
    class T,D1,D2 decision
    class W outcome
    class P broadcast
    class H censor
    class Legend,L1,L2,L3,L4 legend
{% endmermaid %}

## Unrolled Examples

### Maybe Good

#### Did Something, Published Once, Done

{% mermaid %}
graph LR
    I[Incentives] -.-> T{Pick Topic}
    T --> W((Investigate))
    W --> D{Publish?}
    D -->|Yes| P((Publish))
    P --> C{Continue?}
    C -->|No| Stop[Stop]

    I -.-> W
    I -.-> D
    I -.-> C

    %% Causal link styling
    linkStyle 0 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 6 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 7 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 8 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5

    %% Styling
    classDef process fill:#e8f4f8
    classDef decision fill:#fff2cc
    classDef outcome fill:#d4edda
    classDef broadcast fill:#d4edda,stroke:#28a745,stroke-width:5px

    class I process
    class T,D,C decision
    class W,Stop outcome
    class P broadcast
{% endmermaid %}
*Complete, honest reporting of single study*

#### Did Something, Published Twice, Ongoing

{% mermaid %}
graph LR
    I[Incentives] -.-> T{Pick Topic}
    T --> W1((Investigate))
    W1 --> D1{Publish?}
    D1 -->|Yes| P1((Publish))
    P1 --> C1{Continue?}
    C1 -->|Yes| W2((Investigate))
    W2 --> D2{Publish?}
    D2 -->|Yes| P2((Publish))
    P2 --> C2{Continue?}
    C2 -->|Yes| More[...]

    I -.-> W1
    I -.-> D1
    I -.-> C1
    I -.-> W2
    I -.-> D2
    I -.-> C2

    %% Causal link styling
    linkStyle 0 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 9 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 10 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 11 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 12 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 13 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 14 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5

    %% Styling
    classDef process fill:#e8f4f8
    classDef decision fill:#fff2cc
    classDef outcome fill:#d4edda
    classDef broadcast fill:#d4edda,stroke:#28a745,stroke-width:5px

    class I process
    class T,D1,C1,D2,C2 decision
    class W1,W2,More outcome
    class P1,P2 broadcast
{% endmermaid %}
*Transparent research program with full disclosure*

### Maybe Bad

#### Did Something, Censored

{% mermaid %}
graph LR
    I[Incentives] -.-> T{Pick Topic}
    T --> W1((Investigate))
    W1 --> D1{Publish?}
    D1 -->|No| H1((Censor))
    H1 --> C1{Continue?}
    C1 -->|Yes| W2((Investigate))
    W2 --> D2{Publish?}
    D2 -->|No| H2((Censor))
    H2 --> C2{Continue?}
    C2 -->|No| Stop[Stop]

    I -.-> W1
    I -.-> D1
    I -.-> C1
    I -.-> W2
    I -.-> D2
    I -.-> C2

    %% Causal link styling
    linkStyle 0 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 9 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 10 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 11 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 12 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 13 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 14 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5

    %% Styling
    classDef process fill:#e8f4f8
    classDef decision fill:#fff2cc
    classDef outcome fill:#d4edda
    classDef censor fill:#d4edda,stroke:#dc3545,stroke-width:5px

    class I process
    class T,D1,C1,D2,C2 decision
    class W1,W2,Stop outcome
    class H1,H2 censor
{% endmermaid %}
*Two cycles of work, never published - creates publication bias*

### Published, Continued Something, Censored

{% mermaid %}
graph LR
    I[Incentives] -.-> T{Pick Topic}
    T --> W1((Investigate))
    W1 --> D1{Publish?}
    D1 -->|Yes| P((Publish))
    P --> C1{Continue?}
    C1 -->|Yes| W2((Investigate))
    W2 --> D2{Publish?}
    D2 -->|No| H((Censor))
    H --> C2{Continue?}
    C2 -->|No| Stop[Stop]

    I -.-> W1
    I -.-> D1
    I -.-> C1
    I -.-> W2
    I -.-> D2
    I -.-> C2

    %% Causal link styling
    linkStyle 0 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 10 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 11 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 12 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 13 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 14 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 15 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5

    %% Styling
    classDef process fill:#e8f4f8
    classDef decision fill:#fff2cc
    classDef outcome fill:#d4edda
    classDef broadcast fill:#d4edda,stroke:#28a745,stroke-width:5px
    classDef censor fill:#d4edda,stroke:#dc3545,stroke-width:5px

    class I process
    class T,D1,C1,D2,C2 decision
    class W1,W2,Stop outcome
    class P broadcast
    class H censor
{% endmermaid %}
*Cherry-picking: publish positive, hide negative follow-up*


## Publish/Censor process on a Random Walk

The layout of the unrolled graphs imply a typical kind of view of a corrupted
publication process where the publish/censor rate is "spatially" dependent.

<div style="text-align: center;">
<svg width="600" height="300" xmlns="http://www.w3.org/2000/svg">
  <!-- Background regions -->
  <rect x="0" y="0" width="600" height="150" fill="#ffcccc" opacity="0.7"/>
  <rect x="0" y="150" width="600" height="150" fill="#ccffcc" opacity="0.7"/>

  <!-- Dividing line -->
  <line x1="0" y1="150" x2="600" y2="150" stroke="#333" stroke-width="2" stroke-dasharray="5,5"/>

  <!-- Labels -->
  <text x="10" y="30" font-family="Arial" font-size="18" fill="#900">Results I do not like</text>
  <text x="10" y="280" font-family="Arial" font-size="18" fill="#090">Results I like</text>

  <!-- Random walk path -->
  <polyline points="0,150 15,155 25,142 35,148 45,135 55,140 70,125 85,130 95,120 105,135 115,140 125,128 140,145 155,125 165,138 175,145 185,130 195,115 205,108 215,125 225,135 235,148 245,142 260,155 275,148 285,160 295,172 305,165 315,175 325,168 340,185 350,180 365,190 375,185 385,170 395,165 405,158 415,145 425,140 435,155 445,162 460,175 470,188 485,195 495,180 505,175 520,188 530,192 545,185 555,190 570,185 580,178 590,182 600,185" 
            fill="none" stroke="#333" stroke-width="2"/>

  <!-- Censor events (red circles in upper region) -->
  <circle cx="45" cy="135" r="5" fill="#dc3545"/>
  <circle cx="70" cy="125" r="5" fill="#dc3545"/>
  <circle cx="95" cy="120" r="5" fill="#dc3545"/>
  <circle cx="125" cy="128" r="5" fill="#dc3545"/>
  <circle cx="155" cy="125" r="5" fill="#dc3545"/>
  <circle cx="185" cy="130" r="5" fill="#dc3545"/>
  <circle cx="195" cy="115" r="5" fill="#dc3545"/>
  <circle cx="205" cy="108" r="5" fill="#dc3545"/>
  <circle cx="415" cy="145" r="5" fill="#dc3545"/>
  <circle cx="425" cy="140" r="5" fill="#dc3545"/>

  <!-- Publish events (green circles in lower region) -->
  <circle cx="285" cy="160" r="5" fill="#28a745"/>
  <circle cx="295" cy="172" r="5" fill="#28a745"/>
  <circle cx="315" cy="175" r="5" fill="#28a745"/>
  <circle cx="340" cy="185" r="5" fill="#28a745"/>
  <circle cx="350" cy="180" r="5" fill="#28a745"/>
  <circle cx="365" cy="190" r="5" fill="#28a745"/>
  <circle cx="460" cy="175" r="5" fill="#28a745"/>
  <circle cx="470" cy="188" r="5" fill="#28a745"/>
  <circle cx="485" cy="195" r="5" fill="#28a745"/>
  <circle cx="520" cy="188" r="5" fill="#28a745"/>
  <circle cx="530" cy="192" r="5" fill="#28a745"/>
  <circle cx="555" cy="190" r="5" fill="#28a745"/>
  <circle cx="590" cy="182" r="5" fill="#28a745"/>
  <circle cx="600" cy="185" r="5" fill="#28a745"/>

  <!-- Legend -->
  <g transform="translate(450,20)">
    <circle cx="0" cy="0" r="4" fill="#dc3545"/>
    <text x="10" y="4" font-family="Arial" font-size="10">Censor</text>
    <circle cx="0" cy="20" r="4" fill="#28a745"/>
    <text x="10" y="24" font-family="Arial" font-size="10">Publish</text>
  </g>
</svg>
</div>

The random walk shows how outcomes drifting between regions favorable and
unfavorable to the researcher. It is trivial to sample publication points in a
way that favours the incentives of the researcher.
