---
id: DOC-AI-016
title: Predictor Learner Discoverer
status: reviewed
version: 0.3
phase: 0
domain: 10-ai-core
updated: 2026-09-03
---

# Three Roles (binding)

| Role | Responsibility | Must not |
|------|----------------|----------|
| **Predictor** | feature snapshot → Prediction | mutate production weights; run unbounded search |
| **Learner** | outcomes → candidate updates under governance | promote itself; full discovery search |
| **Discoverer** | search space → Discovery Candidates | write champion model; emit orders |

No component may own all three without **hard module boundaries** and separate process budgets (Live vs Research).
