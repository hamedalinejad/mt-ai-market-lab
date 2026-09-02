---
id: DOC-AI-012
title: Online Learning
status: draft
version: 0.2
phase: 0
domain: 10-ai-core
created: 2026-09-01
updated: 2026-09-02
depends_on: [ADR-0007, DOC-LEARN-015]
related: [DOC-LEARN-008, DOC-VAL-022]
---

# Online Learning

## Purpose

Limited live adaptation without letting a single bad observation destroy the promoted model.

## Forbidden

```text
new candle → model.update() → immediate production use
```

## Required governance pipeline

```text
Live Observation
       ↓
Prediction
       ↓
Outcome becomes known
       ↓
Outcome Evaluation
       ↓
Error Classification
       ↓
Candidate Update
       ↓
Shadow Model
       ↓
Validation
       ↓
Promotion / Rollback
```

## Concepts

- **Promoted model**: production; changes only via Promotion
- **Shadow model**: receives candidate online updates; parallel eval
- **Candidate update**: proposed change from error analysis — not auto-written to production

## Constraints

- Light, incremental, bounded steps
- Always versioned and reversible
- No immediate Promotion
- Minimum shadow sample/time budget before Promotion review

## Rules

- Online learning without Shadow + Validation is out of policy.
- Failure Memory feeds candidate updates; it does not directly write production weights.
