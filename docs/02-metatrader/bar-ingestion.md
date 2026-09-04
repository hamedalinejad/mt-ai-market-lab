---
id: DOC-MT5-003
title: Bar Ingestion
status: draft
version: 0.2
phase: 0
domain: 02-metatrader
created: 2026-09-01
updated: 2026-09-01
depends_on: [DOC-MT5-008, DOC-DATA-003, DOC-DATA-023]
related: [DOC-STOR-009]
---

# Bar Ingestion

## Purpose

Path from MT5 rates APIs to canonical candle store, respecting timeframe policy.

## Priority

1. Ingest **M1** (canonical base) for selected instruments
2. Ingest source-native higher TF only if policy exception applies
3. Materialize derived TF as configured (from M1), not by default from redundant MT5 pulls

## Pipeline

```text
MT5 rates API → Raw Bar Store → Normalize → Quality → Canonical Bars
  → update sync_state(instrument_id, timeframe)
```

## Rules

- Prefer one raw source of truth (M1) + derivation over N independent TF histories.
- When source-native higher TF is stored, keep `origin=source_native` and do not overwrite derived partitions without explicit job.

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

