---
id: DOC-DISC-MERGED-001
title: discovery
status: reviewed
phase: 0
created: 2026-09-04
updated: 2026-09-04
depends_on: []
related: []
---
> **Note:** Domain narrative consolidated from multiple former files. Binding contracts remain under `docs/contracts/`. Sections marked TBD are not Phase-0 binding.


# discovery


<!-- merged from docs/13-discovery-engine/live-vs-deep-discovery.md -->

# Live vs Deep Discovery

| Mode | Behavior |
|------|----------|
| Live | Fast incremental discovery; **tiny** CPU/RAM/depth/candidate budget |
| Research / Offline | Deep discovery full search |

Deep discovery must not run inside Live process by default.

## Acceptance Criteria

```text
AC-01
Given this document is binding for its domain
When an implementer builds against it
Then behavior must satisfy the stated invariants and contracts herein
And violations fail validation or static gates before promotion
```

```text
AC-02
Given status is not approved
When production code for this scope is proposed
Then it must be rejected until status reaches approved
```


<!-- merged from docs/13-discovery-engine/relationship-discovery.md -->

# Relationship Discovery

## Purpose

Discover cross-series and structural relationships as Candidates.

## Includes

Cross-market and cross-timeframe relationships when enabled.

## Rules

- All cross-symbol features use **causal availability** (no future of B into decision on A).
- Relationship Candidates still go through Validation and multiplicity accounting.

## Acceptance Criteria

```text
AC-01
Given this document is binding for its domain
When an implementer builds against it
Then behavior must satisfy the stated invariants and contracts herein
And violations fail validation or static gates before promotion
```

```text
AC-02
Given status is not approved
When production code for this scope is proposed
Then it must be rejected until status reaches approved
```


<!-- merged from docs/13-discovery-engine/genetic-programming.md -->

# Genetic Programming

## Purpose

**Separate tool** from Symbolic Regression.

### Goal

```text
evolve expression / rule / strategy
```

GP may evolve:

- expressions (overlap with SR only as a *search algorithm* option for formulas)
- conditional rules
- feature compositions
- strategy structure skeletons (entry/exit logic trees)

When GP is used only to search `f(X)→Y`, document that run as **GP-backed symbolic search**, but the **module boundaries** remain distinct.

## Requirements

- Seed, population, operators, selection logged
- Hard complexity caps (nodes, conditions, nesting)
- Resource-aware population sizes
- Identical Validation and multiple-testing accounting as other searches

## Rules

- GP strategy Candidates are not executable live without Strategy + Risk + Paper gates.
- Nesting limits prevent 17-level operator trees as default-legal.

## Acceptance Criteria

```text
AC-01
Given this document is binding for its domain
When an implementer builds against it
Then behavior must satisfy the stated invariants and contracts herein
And violations fail validation or static gates before promotion
```

```text
AC-02
Given status is not approved
When production code for this scope is proposed
Then it must be rejected until status reaches approved
```


<!-- merged from docs/13-discovery-engine/anomaly-discovery.md -->

# Anomaly Detection

## Before Signal

Bad ticks / price spikes must block or gate Signal generation.

## Two classes

| Class | Example |
|-------|---------|
| **Data anomaly** | EURUSD jumps 1000 pips from corrupted tick |
| **Market anomaly** | EURUSD moves 100 pips on real news |

Data anomalies → quarantine / quality gate. Market anomalies → context for models/risk, not automatic discard of market truth.

## Acceptance Criteria

```text
AC-01
Given this document is binding for its domain
When an implementer builds against it
Then behavior must satisfy the stated invariants and contracts herein
And violations fail validation or static gates before promotion
```

```text
AC-02
Given status is not approved
When production code for this scope is proposed
Then it must be rejected until status reaches approved
```


<!-- merged from docs/13-discovery-engine/discovery-architecture.md -->

# Discovery Architecture

Discovery is **data-source agnostic**. It must not branch on MT5 vs CSV vs Parquet vs Replay — only on canonical datasets and feature snapshots.

## Acceptance Criteria

```text
AC-01
Given this document is binding for its domain
When an implementer builds against it
Then behavior must satisfy the stated invariants and contracts herein
And violations fail validation or static gates before promotion
```

```text
AC-02
Given status is not approved
When production code for this scope is proposed
Then it must be rejected until status reaches approved
```


<!-- merged from docs/13-discovery-engine/feature-discovery.md -->

# feature discovery

## Purpose

Specification for **feature discovery** within the 13-discovery-engine domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD

## Acceptance Criteria

```text
AC-01
Given this document is binding for its domain
When an implementer builds against it
Then behavior must satisfy the stated invariants and contracts herein
And violations fail validation or static gates before promotion
```

```text
AC-02
Given status is not approved
When production code for this scope is proposed
Then it must be rejected until status reaches approved
```


<!-- merged from docs/13-discovery-engine/discovery-objectives.md -->

# Discovery Objectives

## Purpose

State what Discovery **can and cannot** claim.

## What Cannot Be Guaranteed

The system **cannot guarantee** that it will:

- always find something new
- always find something true
- always find something profitable
- recover the “real” causal structure of markets

These are not engineering SLAs; they are scientific impossibilities to promise.

## What We Design For

A **systematic, automated, reproducible** search over a versioned hypothesis space, where every Discovery is a **Candidate** subjected to strict statistical and economic evaluation.

Aligned with project philosophy:

> Discovery ≠ Truth  
> Validation Before Promotion  
> Failed Candidates are retained

## Success Criteria for the Discovery subsystem

| Criterion | Meaning |
|-----------|---------|
| Coverage | Search runs consume budget with logged space version |
| Reproducibility | Same seed + data + space → same Candidate set |
| Discipline | No Candidate skips Validation gates |
| Learning | Failures feed memory; space not blindly expanded |
| Resource honesty | Search respects laptop priority policy |

## Rules

- Marketing language in docs must not imply guaranteed edge discovery.
- Research reports must separate “search activity” from “validated knowledge.”

## Acceptance Criteria

```text
AC-01
Given this document is binding for its domain
When an implementer builds against it
Then behavior must satisfy the stated invariants and contracts herein
And violations fail validation or static gates before promotion
```

```text
AC-02
Given status is not approved
When production code for this scope is proposed
Then it must be rejected until status reaches approved
```


<!-- merged from docs/13-discovery-engine/discovery-memory.md -->

# Discovery Memory

## Purpose

Retain accepted and rejected discoveries with full expression metadata for novelty checks and negative evidence.

## Stores

Explainable formula/pattern payloads (expression, operators, inputs, scores, failure modes).

## Acceptance Criteria

```text
AC-01
Given this document is binding for its domain
When an implementer builds against it
Then behavior must satisfy the stated invariants and contracts herein
And violations fail validation or static gates before promotion
```

```text
AC-02
Given status is not approved
When production code for this scope is proposed
Then it must be rejected until status reaches approved
```


<!-- merged from docs/13-discovery-engine/symbolic-regression.md -->

# Symbolic Regression

## Purpose

**Separate tool** from Genetic Programming.

### Goal

```text
find f(X) → Y
```

Recover an interpretable numeric mapping from features/representation inputs `X` to a target `Y` (e.g. next return, direction score, range), under complexity and stability constraints.

## Non-Goals

- Evolving full trading strategies or multi-rule policies (that is closer to GP / strategy search)
- Unbounded expression growth

## Method Role

Symbolic regression explores the **formula subspace** of Discovery Space: algebraic/temporal expressions with ranked complexity.

## Controls

- Max depth / token length
- Operator whitelist
- Complexity penalty in scoring
- Numerical validity
- Train-only fitness; all promotion via Validation pipeline

## Relationship to GP

| | Symbolic Regression | Genetic Programming |
|--|---------------------|---------------------|
| Primary goal | `f(X)→Y` expressions | Evolve expressions **or** rules **or** strategy structures |
| Output shape | Formula / feature | Broader genotype (rules, trees, graphs) |
| Shared | Same space versioning, scoring penalties, Validation gates |

They **must not** be merged into one vague “evolutionary discovery” concept in specs or code modules.

## Acceptance Criteria

```text
AC-01
Given this document is binding for its domain
When an implementer builds against it
Then behavior must satisfy the stated invariants and contracts herein
And violations fail validation or static gates before promotion
```

```text
AC-02
Given status is not approved
When production code for this scope is proposed
Then it must be rejected until status reaches approved
```


<!-- merged from docs/13-discovery-engine/signal-discovery.md -->

# signal discovery

## Purpose

Specification for **signal discovery** within the 13-discovery-engine domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD

## Acceptance Criteria

```text
AC-01
Given this document is binding for its domain
When an implementer builds against it
Then behavior must satisfy the stated invariants and contracts herein
And violations fail validation or static gates before promotion
```

```text
AC-02
Given status is not approved
When production code for this scope is proposed
Then it must be rejected until status reaches approved
```


<!-- merged from docs/13-discovery-engine/indicator-discovery.md -->

# Indicator Discovery

## Purpose

Treat indicators as **named or unnamed formulas over market representations** subject to the same Candidate lifecycle.

## Layers

1. **Known indicators** — catalog definitions (RSI, MACD, …) as baselines and features.
2. **Parameterized variants** — search periods, smoothers, normalizations.
3. **Novel formulas** — from Formula/Symbolic/GP search.

## Rules

- “Indicator” in production Signal path requires Validation + Knowledge status Active.
- Classic names do not grant exemption from leakage / OOS / multiple-testing controls when claiming edge.

## Acceptance Criteria

```text
AC-01
Given this document is binding for its domain
When an implementer builds against it
Then behavior must satisfy the stated invariants and contracts herein
And violations fail validation or static gates before promotion
```

```text
AC-02
Given status is not approved
When production code for this scope is proposed
Then it must be rejected until status reaches approved
```


<!-- merged from docs/13-discovery-engine/formula-discovery.md -->

# Formula Discovery

## Purpose

Search explainable formulas; every Candidate stores a full **explainability payload**.

## Stored Discovery Record

```text
Discovery ID
Expression
Operators
Inputs
Complexity
Training Score
Validation Score
OOS Score
Regime Stability
Turnover
Failure Modes
Novelty Score
```

Plus: search seed, space version, dataset version, cost_bundle_id when economically evaluated.

## Pipeline

```text
Discovery Space → Expression Search → Candidate Formula
  → Complexity / Novelty filters → Experiment Lab
  → OOS / Walk-Forward / Multiple Testing / Robustness
  → Candidate (≠ Truth) → optional Knowledge graph node
```

## Rules

- Expression AST/string is mandatory; opaque weight blobs alone are insufficient for formula discovery claims.
- Rejected discoveries remain as negative graph nodes / memory.

## Acceptance Criteria

```text
AC-01
Given this document is binding for its domain
When an implementer builds against it
Then behavior must satisfy the stated invariants and contracts herein
And violations fail validation or static gates before promotion
```

```text
AC-02
Given status is not approved
When production code for this scope is proposed
Then it must be rejected until status reaches approved
```


<!-- merged from docs/13-discovery-engine/discovery-registry.md -->

# Discovery Registry

Statuses: `candidate | validated | rejected | retired`

## Acceptance Criteria

```text
AC-01
Given this document is binding for its domain
When an implementer builds against it
Then behavior must satisfy the stated invariants and contracts herein
And violations fail validation or static gates before promotion
```

```text
AC-02
Given status is not approved
When production code for this scope is proposed
Then it must be rejected until status reaches approved
```


<!-- merged from docs/13-discovery-engine/hypothesis-generation.md -->

# hypothesis generation

## Purpose

Specification for **hypothesis generation** within the 13-discovery-engine domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD

## Acceptance Criteria

```text
AC-01
Given this document is binding for its domain
When an implementer builds against it
Then behavior must satisfy the stated invariants and contracts herein
And violations fail validation or static gates before promotion
```

```text
AC-02
Given status is not approved
When production code for this scope is proposed
Then it must be rejected until status reaches approved
```


<!-- merged from docs/13-discovery-engine/strategy-discovery.md -->

# strategy discovery

## Purpose

Specification for **strategy discovery** within the 13-discovery-engine domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD

## Acceptance Criteria

```text
AC-01
Given this document is binding for its domain
When an implementer builds against it
Then behavior must satisfy the stated invariants and contracts herein
And violations fail validation or static gates before promotion
```

```text
AC-02
Given status is not approved
When production code for this scope is proposed
Then it must be rejected until status reaches approved
```


<!-- merged from docs/13-discovery-engine/expression-tree.md -->

# Expression Tree (AST)

Every Discovery Candidate stores:

```text
expression          # serialized form
operators[]
inputs[]
parameters{}
depth
node_count
complexity          # policy score from depth/nodes/ops
ast                 # structured tree (binding for equivalence)
```

Opaque weight blobs alone are insufficient for formula discovery claims.

## Acceptance Criteria

```text
AC-01
Given this document is binding for its domain
When an implementer builds against it
Then behavior must satisfy the stated invariants and contracts herein
And violations fail validation or static gates before promotion
```

```text
AC-02
Given status is not approved
When production code for this scope is proposed
Then it must be rejected until status reaches approved
```


<!-- merged from docs/13-discovery-engine/discovery-confidence.md -->

# Discovery Confidence

Composite (example axes):

```text
Novelty, OOS, Stability, Complexity (penalty), Turnover, Regime stability
→ Discovery Confidence
```

Never a substitute for Validation gates. Discovery never enters production directly:

```text
Discovery → Candidate → Experiment → Validation → Paper → Shadow → Promotion
```

## Acceptance Criteria

```text
AC-01
Given this document is binding for its domain
When an implementer builds against it
Then behavior must satisfy the stated invariants and contracts herein
And violations fail validation or static gates before promotion
```

```text
AC-02
Given status is not approved
When production code for this scope is proposed
Then it must be rejected until status reaches approved
```


<!-- merged from docs/13-discovery-engine/regime-discovery.md -->

# Regime Discovery

## Core regimes (examples)

```text
Trend | Range | High Vol | Low Vol
High Liquidity | Low Liquidity | Event | Transition
```

Models and strategies should condition on `current_regime` when available.

## Regime Transition Detection

Many strategies fail in transitions. Compute/track:

```text
regime transition probability
```

as a first-class analysis/discovery output (Candidate until validated).

## Acceptance Criteria

```text
AC-01
Given this document is binding for its domain
When an implementer builds against it
Then behavior must satisfy the stated invariants and contracts herein
And violations fail validation or static gates before promotion
```

```text
AC-02
Given status is not approved
When production code for this scope is proposed
Then it must be rejected until status reaches approved
```


<!-- merged from docs/13-discovery-engine/hypothesis-ranking.md -->

# Pareto Ranking (not single winner)

Axes (examples):

```text
performance
stability
complexity
turnover
drawdown
novelty
```

Keep non-dominated **Pareto frontier** for Experiment queue; `discovery_score` only prioritizes slots.

## Acceptance Criteria

```text
AC-01
Given this document is binding for its domain
When an implementer builds against it
Then behavior must satisfy the stated invariants and contracts herein
And violations fail validation or static gates before promotion
```

```text
AC-02
Given status is not approved
When production code for this scope is proposed
Then it must be rejected until status reaches approved
```


<!-- merged from docs/13-discovery-engine/pattern-discovery.md -->

# Pattern Discovery

## Purpose

Discover pattern Candidates at three levels. Discovery **never** promotes to Truth without Validation.

## Level 1 — Known Patterns

- Taxonomy: Doji, Hammer, Engulfing, Morning Star, …
- Formal predicates on Candle Representation
- Output: annotations / features / hypothesis seeds
- Still Candidates for any **edge** claim

## Level 2 — Parameterized Patterns

Search over thresholds and combinations, e.g.:

```text
body_ratio < X
wick_ratio > Y
range percentile > Z
direction = up
volatility_context ∈ {compression, …}
```

- X, Y, Z drawn from search space with complexity limits
- Duplicate/novelty checks against Known + prior Candidates

## Level 3 — Unknown Structure Discovery

Unsupervised / representation-learning style search for structures **without** human pattern names:

```text
[shape embedding or geometry cluster A]
+ [volatility regime B]
+ [volume condition C]
+ [time/session context D]
→ change in future return / range distribution
```

Pipeline sketch:

```text
Sequence encoding → similarity/clustering → cluster characterization
  → outcome analysis → Pattern Candidate → Experiment Lab → Validation
```

## Outputs

Always `Candidate` with:

- definition (serializable)
- support set / frequency
- associated outcome metrics (preliminary only)
- links to failed-memory if similar structures failed before

## Rules

- Level 1 definitions live in trading-knowledge; edge tests go through Validation.
- Level 2/3 cannot skip Adversarial / multiple-testing controls.
- No direct path to Order.

## Acceptance Criteria

```text
AC-01
Given this document is binding for its domain
When an implementer builds against it
Then behavior must satisfy the stated invariants and contracts herein
And violations fail validation or static gates before promotion
```

```text
AC-02
Given status is not approved
When production code for this scope is proposed
Then it must be rejected until status reaches approved
```


<!-- merged from docs/13-discovery-engine/unknown-structure-discovery.md -->

# Unknown Structure — Explainable Output

Required payload:

```text
Observed context
Candidate structure
Why novel
Performance
Stability
Evidence
Failure cases
```

No black-box “cluster id” alone as a promotable discovery claim.

## Acceptance Criteria

```text
AC-01
Given this document is binding for its domain
When an implementer builds against it
Then behavior must satisfy the stated invariants and contracts herein
And violations fail validation or static gates before promotion
```

```text
AC-02
Given status is not approved
When production code for this scope is proposed
Then it must be rejected until status reaches approved
```


<!-- merged from docs/13-discovery-engine/technical-discovery.md -->

# technical discovery

## Purpose

Specification for **technical discovery** within the 13-discovery-engine domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD

## Acceptance Criteria

```text
AC-01
Given this document is binding for its domain
When an implementer builds against it
Then behavior must satisfy the stated invariants and contracts herein
And violations fail validation or static gates before promotion
```

```text
AC-02
Given status is not approved
When production code for this scope is proposed
Then it must be rejected until status reaches approved
```

