---
id: DOC-CONTRACT-DATA-derived-tf
title: Derived Timeframes
status: reviewed
version: 0.3
phase: 0
domain: contracts
updated: 2026-09-04
related: [ADR-0013]
---

# Timeframe Relationship & Ownership (BUG-P0-018 / 019)

## Ownership
Each series declares:
```text
source_native | derived | synthetic
```

Derived series have **materialization state** (not built, building, ready, stale, failed).

## If M5 built from M1, specify
```text
anchor rules
missing constituent bars handling
incomplete aggregation
session breaks
DST
source precedence
```

Incomplete aggregates must not be labeled CANDLE_CLOSED.
