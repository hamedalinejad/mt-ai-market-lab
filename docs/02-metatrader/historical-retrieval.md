---
id: DOC-MT5-008
title: Historical Retrieval
status: draft
version: 0.2
phase: 0
domain: 02-metatrader
created: 2026-09-01
updated: 2026-09-01
depends_on: [DOC-MT5-009]
related: [DOC-SYNC-005, DOC-DATA-023, DOC-DATA-012]
---

# Historical Retrieval

## Purpose

Specify how historical bars and ticks are pulled from MT5 into the lab pipelines.

## Capabilities (Python API class)

- Bar ranges via `copy_rates_*` family (from pos, from date, range)
- Tick ranges via `copy_ticks_*` / `copy_ticks_range`
- Availability depends on terminal history, broker, and symbol

## Alignment with Timeframe Policy

Default retrieval priority:

1. Ensure **M1** (canonical base) coverage for selected instruments
2. Optionally retrieve **ticks** for configured instruments
3. Retrieve **source-native higher TF** only when timeframe policy exception applies (depth/session/config)

Do not blindly download every TF “because it exists on the terminal.”

## Batching

- History loads run in bounded batches (time or bar count)
- Each batch: raw write → normalize → quality → canonical → advance cursor
- Idempotent: overlapping ranges dedupe on canonical key

## Limits & Failure Modes

| Issue | Handling |
|-------|----------|
| Empty return | Classify: no data vs not yet synced in terminal vs API error |
| Partial range | Store what validated; do not advance cursor past hole without gap record |
| Terminal history not loaded | Operator/terminal action may be required; lab surfaces health |

## Rules

- Historical retrieval is owned by Sync/Backfill, not by Live Collector
- Source-native vs derived must be labeled when both exist

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

