---
id: DOC-RUN-002
title: Live Analysis Mode
status: draft
version: 0.2
phase: 0
domain: 21-runtime-modes
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-RUN-001]
related: [DOC-MT5-011, DOC-AI-012]
---

# Live Analysis Mode

## Process

Runs in the **LIVE PROCESS**:

```text
MT5 → Data Collector → Feature Engine → Inference → Signal (+ light shadow learning)
```

## Includes

- MT5 connection, sync, live data
- Analysis, prediction, signal
- Light online learning **only** via shadow + governance
- Monitoring

## Excludes

- Heavy training
- Full Discovery search
- Adversarial campaigns that starve live resources

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

