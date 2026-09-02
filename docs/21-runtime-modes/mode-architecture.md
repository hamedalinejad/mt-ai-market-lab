---
id: DOC-RUN-001
title: Mode Architecture
status: draft
version: 0.2
phase: 0
domain: 21-runtime-modes
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-RES-009]
related: [DOC-RUN-002, DOC-RUN-003, DOC-AI-001]
---

# Mode Architecture

## Purpose

Separate **Live** from **Training/Research** so heavy jobs cannot corrupt the live path.

## Process Separation (required direction)

```text
LIVE PROCESS
   │
   ├── MT5
   ├── Data Collector
   ├── Feature Engine
   ├── Inference
   └── Signal

TRAINING PROCESS
   │
   ├── Dataset
   ├── Training
   ├── Discovery
   ├── Validation
   └── Model Candidate
```

Promotion path:

```text
Candidate → Validation → Promotion → Live Model
```

## Why separate processes

- A training OOM or discovery storm must not kill live inference.
- Online learning stays shadow-governed inside or beside Live, not unbounded `model.update()` on production weights.
- Research Mode may use High Performance profile; Live stays on Laptop/Standard unless explicitly configured.

## Rules

- Shared **storage and state DB** are allowed; shared **process** for Live + heavy Training/Discovery is not the default.
- Promotion is the only path that changes the live promoted model.
