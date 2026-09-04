---
id: DOC-PATH-16-SIGNAL-ENGINE-SIGNAL-ARCHITECTURE-MD
title: Signal Architecture
status: draft
version: 0.2
phase: 0
domain: 16-signal-engine
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-PRED-001, ADR-0005]
related: [DOC-SIG-012, DOC-SIG-002]
---

# Signal Architecture

## Purpose

Keep **Signal** independent from **Prediction**.

```text
Prediction ≠ Decision
```

## Assembly Path

```text
Prediction
+
Analysis
+
Discovery
+
Context
+
Knowledge
       ↓
Signal Candidate
       ↓
Signal Validation
       ↓
Signal Confidence
       ↓
Signal
```

## Rules

- A Prediction alone does not create a production Signal.
- Evidence, knowledge refs, and Trace are mandatory for material signals.
- Risk Engine may veto after Signal creation; Execution remains further downstream.

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

