---
id: DOC-PATH-16-SIGNAL-ENGINE-SIGNAL-MODEL-MD
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

