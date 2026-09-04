---
id: DOC-MERGED
title: metatrader
status: reviewed
phase: 0
---

# metatrader


<!-- merged from docs/02-metatrader/bar-ingestion.md -->

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


<!-- merged from docs/02-metatrader/live-feed.md -->

# Live Feed

## Purpose

Near-live pull collector (not assumed full broker push stream).

## Effectively-Once

If a tick/bar arrives twice:

```text
tick_id / (timestamp + sequence) / composite bar key
```

→ **dedupe**, never double-insert into canonical stores.

## Cursor Safety

```text
last_persisted advances only after durable publish + validation
```

After crash at tick 100000, restart continues from last persisted (e.g. 99998), not from an in-memory counter.

## Rules

- Live Collector is Resource-aware and health-reported.
- Historical gaps are Sync/Backfill, not Live.

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


<!-- merged from docs/02-metatrader/tick-ingestion.md -->

# Tick Ingestion

## Purpose

Path from MT5 tick APIs to canonical tick store.

## Sources

- Live: Live Collector polling / ranged copy since cursor
- Historical: `copy_ticks_range` (or equivalent) batches

## Pipeline

```text
MT5 tick API → Raw Tick Store → Normalize (UTC, instrument_id)
  → Quality (bid/ask, duplicates) → Canonical Tick Store → sync_state
```

## Rules

- Tick ingestion is optional per instrument (resource-aware).
- Canonical ticks never required for pure M1-based pipelines.
- Bar building from ticks uses versioned definition if used as source of truth for that instrument.

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


<!-- merged from docs/02-metatrader/error-handling.md -->

# Error Handling

## Purpose

Specification for **Error Handling** within the 02-metatrader domain.

## Scope

Phase 0 — Documentation First. This is a Specification document, not implementation.

## Definitions

TBD

## Requirements

TBD — to be refined from Master Blueprint.

## Architecture

TBD

## Inputs

TBD

## Outputs

TBD

## Rules

TBD

## Dependencies

TBD

## Failure Modes

TBD

## Validation

TBD

## Acceptance Criteria

TBD

## Risks

TBD

## Open Questions

TBD

## Related Documents

- Master Blueprint (root reference)
- Domain README


<!-- merged from docs/02-metatrader/symbol-discovery.md -->

# Symbol Discovery

## Purpose

Build a **dynamic symbol universe** from MT5 and configuration.

## API Surface (reference)

`symbols_get()` (and related) can list instruments and filter by group.

## Universe Layers

```text
Configured Symbols     # operator allowlist / config
Available Symbols      # currently visible from terminal/broker
Discovered Symbols     # newly seen via discovery scan
Disabled Symbols       # explicitly off
```

## Rules

- Selection for sync/live is Configured ∩ Available (unless operator forces otherwise).
- Discovered symbols do not auto-enable pipelines without configuration.
- Instrument metadata snapshot on enable.

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


<!-- merged from docs/02-metatrader/market-sessions.md -->

# Market Sessions

## Purpose

Model trading sessions and closures used for gap classification and session features.

## Concepts

- **Session segment** — continuous trading window (e.g. exchange session).
- **Market closed** — expected non-trading interval (weekend, holiday, daily break).
- **Session calendar** — versioned schedule per instrument or asset class.

## Use in Gap Logic

If no bar is expected because the market is closed under the active calendar, gap class is **expected_market_closure** (or holiday/session_break), not `source_missing`.

## Rules

- Crypto 24/7 calendars differ from FX; asset class selects default calendar family.
- Calendar version is part of dataset lineage.

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


<!-- merged from docs/02-metatrader/terminal-state.md -->

# Terminal State

## Purpose

Specification for **Terminal State** within the 02-metatrader domain.

## Scope

Phase 0 — Documentation First. This is a Specification document, not implementation.

## Definitions

TBD

## Requirements

TBD — to be refined from Master Blueprint.

## Architecture

TBD

## Inputs

TBD

## Outputs

TBD

## Rules

TBD

## Dependencies

TBD

## Failure Modes

TBD

## Validation

TBD

## Acceptance Criteria

TBD

## Risks

TBD

## Open Questions

TBD

## Related Documents

- Master Blueprint (root reference)
- Domain README


<!-- merged from docs/02-metatrader/broker-time.md -->

# Broker Time

## Purpose

Treat **broker/terminal server time** as a first-class input to the data plane (P0).

## Why P0

MT5 history and “bar time” are interpreted in the terminal/broker time context. DST changes, server offset, and daily boundaries affect:

- which UTC instant is the open of D1
- whether a hole is weekend closure or data loss
- alignment between TFs when deriving from M1

## Responsibilities of MT5 Adapter

1. Read server/broker time related fields available from the terminal API.
2. Attach `source_timestamp`, `broker_server_time` (when available), and zone/offset metadata to raw batches.
3. Never silently cast bar open integers to “UTC” without recording the conversion policy version.
4. Surface clock skew health: lab UTC vs last known server time delta.

## Rules

- Sync and gap logic consume **normalized UTC** plus **session calendar**, both versioned.
- Operator documentation must state which broker server timezone assumption is active.

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


<!-- merged from docs/02-metatrader/historical-retrieval.md -->

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


<!-- merged from docs/02-metatrader/connection-contract.md -->

# Connection State Machine

```text
DISCONNECTED → CONNECTING → CONNECTED
                    ↓
               DEGRADED ↔ RECONNECTING
                    ↓
                 FAILED
```

Transitions emit events. FAILED → Safe Mode / alert per policy. Reconnect uses backoff (ops retry policy).

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


<!-- merged from docs/02-metatrader/symbol-selection.md -->

# Symbol Lifecycle States

```text
discovered → selected → verified → available
disabled (orthogonal / terminal state)
```

| State | Meaning |
|-------|---------|
| discovered | seen via symbols_get / scan |
| selected | in operator config allowlist |
| verified | metadata snapshot ok |
| available | Market Watch + data path ready |
| disabled | explicitly off |

Pipelines only on **available** (unless research override).

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


<!-- merged from docs/02-metatrader/terminal-connection.md -->

# Terminal Connection

## Purpose

Specification for **Terminal Connection** within the 02-metatrader domain.

## Scope

Phase 0 — Documentation First. This is a Specification document, not implementation.

## Definitions

TBD

## Requirements

TBD — to be refined from Master Blueprint.

## Architecture

TBD

## Inputs

TBD

## Outputs

TBD

## Rules

TBD

## Dependencies

TBD

## Failure Modes

TBD

## Validation

TBD

## Acceptance Criteria

TBD

## Risks

TBD

## Open Questions

TBD

## Related Documents

- Master Blueprint (root reference)
- Domain README


<!-- merged from docs/02-metatrader/data-availability.md -->

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


<!-- merged from docs/02-metatrader/broker-metadata.md -->

# Broker Metadata

## Purpose

Specification for **Broker Metadata** within the 02-metatrader domain.

## Scope

Phase 0 — Documentation First. This is a Specification document, not implementation.

## Definitions

TBD

## Requirements

TBD — to be refined from Master Blueprint.

## Architecture

TBD

## Inputs

TBD

## Outputs

TBD

## Rules

TBD

## Dependencies

TBD

## Failure Modes

TBD

## Validation

TBD

## Acceptance Criteria

TBD

## Risks

TBD

## Open Questions

TBD

## Related Documents

- Master Blueprint (root reference)
- Domain README


<!-- merged from docs/02-metatrader/reconnect.md -->

# MT5 Reconnect

Retry with backoff; after reconnect: verify symbols, sync from last_persisted, reconcile orders/positions if execution enabled. Do not assume in-memory state survived.

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


<!-- merged from docs/02-metatrader/integration-overview.md -->

# Integration Overview

## Purpose

Specification for **Integration Overview** within the 02-metatrader domain.

## Scope

Phase 0 — Documentation First. This is a Specification document, not implementation.

## Definitions

TBD

## Requirements

TBD — to be refined from Master Blueprint.

## Architecture

TBD

## Inputs

TBD

## Outputs

TBD

## Rules

TBD

## Dependencies

TBD

## Failure Modes

TBD

## Validation

TBD

## Acceptance Criteria

TBD

## Risks

TBD

## Open Questions

TBD

## Related Documents

- Master Blueprint (root reference)
- Domain README

