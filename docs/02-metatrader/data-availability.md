---
id: DOC-MT5-007
title: Data Availability
status: draft
version: 0.2
phase: 0
domain: 02-metatrader
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-MT5-008, DOC-SYNC-013]
related: [DOC-DATA-012, DOC-DATA-013]
---

# Data Availability

## Purpose

MT5 does **not** guarantee unlimited history for every symbol/timeframe. The lab must never pretend missing data exists.

## Availability Object

```text
requested_range
available_range
missing_range
broker_limitation
terminal_limitation
local_cache
```

## Rules

- Sync/backfill reports honest coverage.
- Experiments declare required range; if unavailable, experiment is blocked or marked degraded — not silently filled with fiction.
- Gaps classified (expected vs source_missing, etc.).

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

