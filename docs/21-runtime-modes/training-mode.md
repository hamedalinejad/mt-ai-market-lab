---
id: DOC-PATH-21-RUNTIME-MODES-TRAINING-MODE-MD
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

