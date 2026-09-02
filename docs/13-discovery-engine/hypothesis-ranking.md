---
id: DOC-DISC-010
title: Hypothesis Ranking
status: draft
version: 0.2
phase: 0
domain: 13-discovery-engine
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-DISC-001]
related: [DOC-DISC-008, DOC-VAL-001]
---

# Hypothesis Ranking

## Purpose

Rank Candidates for limited Experiment Lab slots using a **penalized** score — raw in-sample performance is never enough.

## Discovery Score (logical)

```text
discovery_score =
    performance
  - complexity_penalty
  - instability_penalty
  - turnover_penalty
  - data_snooping_penalty
  - regime_dependence_penalty
```

| Term | Intent |
|------|--------|
| performance | Task metric on **training / search** split only (never final proof) |
| complexity_penalty | Depth, terms, conditions, free parameters |
| instability_penalty | Sensitivity to small param/time perturbations |
| turnover_penalty | If Candidate implies trading intensity |
| data_snooping_penalty | Function of search budget / family size used to find it |
| regime_dependence_penalty | Edge concentrated in one regime only |

Exact functional forms are Benchmark/Validation parameters; the **structure** of penalties is mandatory.

## Rules

- Score is for **queue priority**, not Promotion.
- Promotion uses Validation pipeline outcomes, not discovery_score alone.
