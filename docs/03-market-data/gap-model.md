---
id: DOC-DATA-013
title: Gap Model
status: draft
version: 0.2
phase: 0
domain: 03-market-data
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-DATA-022, DOC-DATA-018, DOC-DATA-023]
related: [DOC-SYNC-004, DOC-SYNC-003, DOC-SYNC-009]
---

# Gap Model

## Purpose

Represent missing expected bars/ticks as structured objects. **A gap is not automatically a bug.**

## Definition

A **gap** is an interval where the timeframe grid (or tick continuity policy) predicts data should or might exist, but local canonical coverage is incomplete or broken.

## Gap Entity (logical)

| Field | Description |
|-------|-------------|
| gap_id | Stable id |
| instrument_id | |
| timeframe | or TICK |
| start_utc | Inclusive start of missing/broken interval |
| end_utc | Exclusive end |
| expected_bar_count | If grid-based |
| gap_class | See classification |
| severity | info \| warn \| error |
| detected_at | |
| detected_by | sync_run id |
| resolution | open \| accepted_expected \| repaired \| ignored_policy |
| notes | |

## Expected vs Unexpected

| Kind | Example | Default severity |
|------|---------|------------------|
| Expected closure | FX Friday close → Monday open | info |
| Holiday | Exchange holiday | info |
| Session break | Intraday break if applicable | info |
| Unexpected hole | Mid-week missing M1 while market open | error |
| Corrupt / conflict | Bar exists but fails integrity | error |

## Rules

- Gap detection uses **session calendar + timezone policy version**.
- Expected gaps do not block “coverage healthy” if classified and accepted.
- Unexpected gaps block promotion of affected ranges into training datasets by default.
- Filling gaps with synthetic bars requires `quality_status=gap_filled` and explicit experiment opt-in.

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

