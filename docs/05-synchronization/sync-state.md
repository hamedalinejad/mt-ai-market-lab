---
id: DOC-SYNC-013
title: Sync State
status: draft
version: 0.2
phase: 0
domain: 05-synchronization
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-STOR-010, DOC-DATA-023]
related: [DOC-SYNC-001, DOC-SYNC-003, DOC-SYNC-009]
---

# Sync State

## Purpose

Persist a real **per-series control-plane entity** so the system knows, after downtime, what was last seen, what was last safely stored, and what remains open.

## Entity: `sync_state`

One row (logical) per `(instrument_id, timeframe, source)`:

| Field | Description |
|-------|-------------|
| instrument_id | Internal instrument |
| timeframe | M1, H1, TICK, … |
| source | mt5 \| import \| … |
| last_seen_timestamp | Latest timestamp observed from source (may be > persisted) |
| last_persisted_timestamp | Latest timestamp safely in canonical store |
| first_available_timestamp | Earliest canonical timestamp held locally |
| expected_next_timestamp | Next grid open (bars) or next expected tick watermark |
| sync_status | see state machine |
| gap_count | Count of open unexpected gaps (and/or breakdown JSON) |
| last_sync_at | Lab time of last sync attempt completion |
| last_success_at | Last fully successful sync |
| last_error | Code/message of last failure |
| policy_versions | timezone/session/timeframe policy ids |
| updated_at | |

## State Machine (`sync_status`)

```text
                    ┌──────────────┐
                    │  uninitialized│
                    └──────┬───────┘
                           │ discover + first plan
                           ▼
                    ┌──────────────┐
              ┌─────│    idle      │◄────┐
              │     └──────┬───────┘     │
              │            │ work        │ success
              │            ▼             │
              │     ┌──────────────┐     │
              │     │ backfilling  │─────┤
              │     └──────┬───────┘     │
              │            │             │
              │            ▼             │
              │     ┌──────────────┐     │
              │     │   live       │─────┘
              │     └──────┬───────┘
              │            │ error
              │            ▼
              │     ┌──────────────┐
              └────►│   error      │──retry/partial──► backfilling/live
                    └──────────────┘
```

Additional flags/substates (optional fields): `reconciling`, `paused`, `disabled`.

### Semantics

| Status | Meaning |
|--------|---------|
| uninitialized | No successful canonical data yet |
| idle | Up to date w.r.t. policy; waiting |
| backfilling | Historical/gap fill in progress |
| live | Incremental follow of source |
| error | Last run failed; cursor not advanced unsafely |

## Cursor Safety Rule

**`last_persisted_timestamp` advances only after** canonical publish + validation for that batch succeed.

`last_seen_timestamp` may move earlier for diagnostics without implying durability.

## Multi-TF

Separate `sync_state` rows for M1, each source-native TF, and TICK. Derived TFs may have materialization state separate from source sync.

## Rules

- Restart loads all `sync_state` rows before live polling.
- Health UI/API must answer: last M1 persisted, open unexpected gaps, last error.
