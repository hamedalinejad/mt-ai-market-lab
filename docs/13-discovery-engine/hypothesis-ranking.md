---
id: DOC-PATH-13-DISCOVERY-ENGINE-HYPOTHESIS-RANKING-MD
title: Hypothesis Ranking
status: reviewed
version: 0.4
phase: 0
domain: 13-discovery-engine
---

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

