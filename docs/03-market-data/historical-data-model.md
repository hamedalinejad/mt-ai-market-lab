---
id: DOC-PATH-03-MARKET-DATA-HISTORICAL-DATA-MODEL-MD
title: Historical Data Model
status: draft
version: 0.2
phase: 0
domain: 03-market-data
created: 2026-09-01
updated: 2026-09-01
depends_on: [DOC-DATA-001, DOC-STOR-009]
related: [DOC-SYNC-005, DOC-ING-001]
---

# Historical Data Model

## Purpose

Describe historical series as first-class datasets: coverage, continuity, and reproducibility.

## Concepts

### Series

One `(instrument_id, timeframe)` history.

### Coverage Interval

`[coverage_start_utc, coverage_end_utc]` stored in sync_state / catalog.

### Gap

Missing expected bars on the timeframe grid (see gap-model). Gaps are classified; not all gaps are errors (market closed).

### Snapshot / Dataset

Immutable set of partitions + manifest used for an experiment or training run.

## Historical Load Paths

1. MT5 historical retrieval → raw → canonical
2. External Parquet/CSV → map → canonical
3. Resample from lower timeframe (derived series; new lineage)

## Continuity Rules

- After sync, catalog must answer: “Do we have continuous ok-quality bars from A to B excluding classified closures?”
- Training dataset builder must exclude `rejected` and optionally exclude `gap_filled` unless experiment opts in.

## Reproducibility

A historical dataset reference includes:

- partition URIs
- schema_version
- quality filter
- code/version of builder
- checksums

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

