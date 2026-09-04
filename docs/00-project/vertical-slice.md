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


<!-- merged from docs/00-project/vertical-slice-approval.md -->

# Vertical Slice — Approved for implementation start

Package marked **approved**:

- Tick, Candle, Quote, Time model, Identity
- MarketDataProvider + MT5 boundary
- Sync cursor + Gap + Atomic publish
- Storage layout + SQLite DDL v001 + migration contract
- Replay equality policy
- Feature / Label / Prediction baseline contracts
- Risk authority + Order intent + Safe Mode + Reconciliation

## Still out of scope for first code
Advanced Discovery, macro ingestion, multi-account, distributed training.

## Acceptance Criteria

```text
AC-SLICE-01
Given engineer starts coding vertical slice
When they implement only approved package surfaces
Then that work is authorized under Documentation First exception for this slice only
```

Governing baseline: [implementation-baseline.md](implementation-baseline.md)
