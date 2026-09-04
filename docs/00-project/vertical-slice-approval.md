---
id: DOC-PROJ-036
title: Vertical Slice Approval Package
status: approved
version: 1.0
phase: 0
domain: 00-project
updated: 2026-09-04
---

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
