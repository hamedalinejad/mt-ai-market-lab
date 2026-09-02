---
id: DOC-CONTRACT-IF-002
title: ModelAdapter Interface
status: draft
version: 0.2
phase: 0
domain: contracts
created: 2026-09-01
updated: 2026-09-02
depends_on: [ADR-0003]
---

# ModelAdapter

Model-agnostic boundary. Frameworks are not locked in Phase 0.

## Lightweight baseline candidates

```text
Logistic Regression | Linear / Elastic Net
Random Forest | Extra Trees | Gradient Boosting
Online linear models
Small MLP only if needed
→ specialist ensemble
```

Not a giant neural net by default on laptop.
