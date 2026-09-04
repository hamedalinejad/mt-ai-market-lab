---
id: DOC-PATH-11-LEARNING-AND-SELF-CORRECTION-LEARNING-SAFETY-MD
title: Learning Safety
status: draft
version: 0.2
phase: 0
domain: 11-learning-and-self-correction
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-LEARN-001, ADR-0007]
related: [DOC-AI-012, DOC-LEARN-008]
---

# Learning Safety

## Purpose

Bound learning so mistakes correct the system **through governance**, not through erasure or blind updates.

## Forbidden

```text
new candle → model.update() → production
```

```text
mistake → delete the mistake from history
```

## Required

```text
Observation → Prediction → Outcome → Evaluation
  → Error Classification → Candidate Update
  → Shadow Model → Validation → Promotion / Rollback
```

```text
Failure → Failure Memory → Training Signal / Negative Evidence
```

## Rules

- Production weights change only via Promotion.
- Shadow models absorb candidate online updates.
- Failure Memory is mandatory evidence, not disposable log noise.
