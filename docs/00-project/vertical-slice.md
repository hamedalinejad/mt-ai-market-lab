---
id: DOC-PROJ-021
title: Vertical Slice Before Advanced AI
status: approved
version: 0.2
phase: 0
domain: 00-project
updated: 2026-09-04
---

# First Real Path (before advanced Discovery)

```text
MT5 → Symbol Discovery → M1 Historical → Raw → Canonical → Sync State
 → Restart → Backfill → Quality → Replay → Simple Feature → Baseline Model
 → Prediction → Validation → Signal → Paper Order → Outcome → Failure Memory
```

This slice beats building advanced Discovery on day one.

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

