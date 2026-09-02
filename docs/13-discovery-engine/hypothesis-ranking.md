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
related: [DOC-VAL-012]
---

# Hypothesis Ranking

## Pareto Frontier

Prefer a **front of Candidates**, not a single winner:

```text
Candidate A / B / C  — each best on different objectives
```

Rank for queue slots using penalized scores; keep multi-objective non-dominated sets for human/Experiment review.
