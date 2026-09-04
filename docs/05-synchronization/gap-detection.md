---
id: DOC-SYNC-003
title: Gap Detection
status: draft
version: 0.2
phase: 0
domain: 05-synchronization
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-DATA-013, DOC-DATA-023]
related: [DOC-SYNC-004, DOC-SYNC-013]
---

# Gap Detection

## Purpose

Find holes or continuity breaks in local canonical series.

## Bar Series Algorithm (logical)

1. Load coverage for `(instrument_id, timeframe)` from catalog/sync_state.
2. Build expected open timestamps on the TF grid between `first_available` and `last_persisted` using session calendar.
3. Diff expected vs present `utc_timestamp` set.
4. Merge contiguous missing opens into gap intervals.
5. Pass intervals to **Gap Classification**.

## Tick Series

Continuity rules differ (max idle duration while session open). Thresholds are configurable and versioned.

## Triggers

- End of each sync batch
- Startup reconciliation
- Periodic health scan (low priority workload)

## Rules

- Detection without calendar is incomplete (will false-positive weekends).
- Results written as Gap entities; counts rolled into `sync_state.gap_count` (unexpected vs total may be separate metrics).

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

