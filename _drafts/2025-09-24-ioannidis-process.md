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
    D1 -->|Yes| P((Broadcast))
    D1 -->|No| H((Censor))

    P --> D2{Continue?}
    H --> D2

    D2 -->|Yes| W

    I -.-> D1
    I -.-> D2

    %% Causal link styling
    linkStyle 0 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 7 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 8 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5

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
    D -->|Yes| P((Broadcast))
    P --> C{Continue?}
    C -->|No| Stop[Stop]

    I -.-> D
    I -.-> C

    %% Causal link styling
    linkStyle 0 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 5 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 6 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5

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
    D1 -->|Yes| P1((Broadcast))
    P1 --> C1{Continue?}
    C1 -->|Yes| W2((Investigate))
    W2 --> D2{Publish?}
    D2 -->|Yes| P2((Broadcast))
    P2 --> C2{Continue?}
    C2 -->|Yes| More[...]

    I -.-> D1
    I -.-> C1
    I -.-> D2
    I -.-> C2

    %% Causal link styling
    linkStyle 0 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 8 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 9 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 10 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 11 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5

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

    I -.-> D1
    I -.-> C1
    I -.-> D2
    I -.-> C2

    %% Causal link styling
    linkStyle 0 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 8 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 9 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 10 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 11 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5

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
    D1 -->|Yes| P((Broadcast))
    P --> C1{Continue?}
    C1 -->|Yes| W2((Investigate))
    W2 --> D2{Publish?}
    D2 -->|No| H((Censor))
    H --> C2{Continue?}
    C2 -->|No| Stop[Stop]

    I -.-> D1
    I -.-> C1
    I -.-> D2
    I -.-> C2

    %% Causal link styling
    linkStyle 0 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 9 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 10 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 11 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5
    linkStyle 12 stroke:#ff9bb3,stroke-width:2px,stroke-dasharray: 5 5

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


