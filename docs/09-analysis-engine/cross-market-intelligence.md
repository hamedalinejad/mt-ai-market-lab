---
id: DOC-ANLY-XMARKET
title: Cross-Market Intelligence
status: approved
version: 1.0
phase: 0
domain: 09-analysis-engine
created: 2026-09-04
updated: 2026-09-04
depends_on: ['DOC-PROJ-052']
---

# Cross-Market Intelligence

Research and **context** layer — not automatic authority.

## Relationship levels
```text
Association → Predictive dependence → Conditional dependence → Causal hypothesis
```

## Causal discipline
May use lag analysis, Granger-style tests, information-theoretic measures, structural hypothesis tests, regime-conditioned analysis, intervention-inspired simulations.

**No simulated intervention alone proves structural causality.**

Causal claims must record:
```text
claim type, assumptions, observed evidence, confounder limitations,
regime scope, stability, validation evidence, confidence
```

## Graph edge governance
```text
source_node, target_node, lag, weight, method, window, regime,
confidence, sample size, last_validated_at, stability_score, status
```
Edges decay or become uncertain unless periodically revalidated.
