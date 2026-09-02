---
id: DOC-RUN-003
title: Training Mode
status: draft
version: 0.2
phase: 0
domain: 21-runtime-modes
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-RUN-001]
related: [DOC-AI-001, DOC-VAL-022]
---

# Training Mode

## Process

Runs in the **TRAINING PROCESS** (separate from Live by default):

```text
Dataset → Training → Discovery (optional) → Validation → Model Candidate
```

## Promotion

```text
Candidate → Validation → Promotion → Live Model
```

## Rules

- Must not share process with Live under default Laptop/Standard profiles.
- May use Research / High Performance resource profile.
