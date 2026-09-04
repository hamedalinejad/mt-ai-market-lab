---
id: DOC-DATA-024
title: Tick Model
status: draft
version: 0.2
phase: 0
domain: 03-market-data
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-DATA-001, DOC-DATA-022]
related: [DOC-DATA-026, DOC-SYNC-007]
---

# Tick Model

## Identity

```text
tick_id (when source provides) OR (instrument_id, utc_timestamp, sequence)
```

## Fields (logical)

bid, ask, last (if any), volume, flags, source timestamps → UTC, quality_status

## Independent dataset

Ticks are not disposable after candle build. Uses: spread, microstructure, slippage, liquidity, execution, anomaly, vol, price formation.

## Tiering

Hot recent ticks / Cold compressed historical ticks.

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

