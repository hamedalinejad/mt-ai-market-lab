---
id: DOC-AI-017
title: Drift Detection
status: reviewed
version: 0.3
phase: 0
domain: 10-ai-core
---

# Drift Types and Actions

| Type | Meaning | Example action |
|------|---------|----------------|
| **data drift** | input distribution shift | alert; tighten quality gates |
| **feature drift** | feature marginals/joints shift | invalidate snapshot path; recompute |
| **label drift** | label distribution shift | hold promotion; review labels |
| **concept drift** | P(y\|x) change | challenger retrain; degrade champion |
| **performance drift** | live metrics vs baseline | DEGRADED / rollback |
| **calibration drift** | reliability curve break | recalibrate or disable decision_score |

Each type has threshold + severity + escalation in policy version — not one generic “drift” flag.
