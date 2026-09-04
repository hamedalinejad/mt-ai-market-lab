---
id: DOC-DISC-014
title: Pattern Discovery
status: draft
version: 0.2
phase: 0
domain: 13-discovery-engine
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-DISC-001, DOC-REPR-002, DOC-DISC-006]
related: [DOC-DISC-021, DOC-TKNW-003, DOC-VAL-001]
---

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

