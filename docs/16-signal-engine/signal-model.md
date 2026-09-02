---
id: DOC-SIG-002
title: Signal Model
status: draft
version: 0.2
phase: 0
domain: 16-signal-engine
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-SIG-001]
related: [DOC-SIG-012, DOC-LEARN-008]
---

# Signal Model

## Purpose

Signal is an independent entity with lifecycle and trace.

## Core Fields

```text
Symbol / instrument_id
Timeframe
Direction
Horizon
Strength
Confidence
Prediction References
Evidence
Supporting Knowledge
Contradicting Knowledge
Expiration
Status
Trace
```

## Lifecycle

```text
CREATED
  ↓
CONFIRMED
  ↓
ACTIVE
  ↓
UPDATED
  ↓
EXPIRED
  ↓
RESOLVED
```

If wrong:

```text
FAILED
```

## Rules

- **FAILED signals are not deleted.** They are recorded and linked to Failure Memory and outcome evaluation.
- EXPIRED / RESOLVED remain in history for learning and audit.
- Status transitions are explicit and timestamped.
