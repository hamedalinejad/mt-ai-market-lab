---
id: DOC-SIG-001
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
