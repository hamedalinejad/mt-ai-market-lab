---
id: DOC-DATA-MERGED-001
title: market-data
status: reviewed
phase: 0
---
> **Note:** Domain narrative consolidated from multiple former files. Binding contracts remain under `docs/contracts/`. Sections marked TBD are not Phase-0 binding.


# market-data


<!-- merged from docs/03-market-data/anomaly-model.md -->

# anomaly model

## Purpose

Specification for **anomaly model** within the 03-market-data domain.

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


<!-- merged from docs/03-market-data/validation-rules.md -->

# validation rules

## Purpose

Specification for **validation rules** within the 03-market-data domain.

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


<!-- merged from docs/03-market-data/candle-model.md -->

# Candle Model

## Core Fields

```text
instrument_id, timeframe, utc_timestamp
open, high, low, close
volume / tick_volume (as available)
quality_status, origin (source_native | derived)
```

## OHLC Invariants (formal)

For every valid candle:

```text
High >= Open
High >= Close
High >= Low

Low  <= Open
Low  <= Close
Low  <= High

range = high - low >= 0
body  = abs(close - open)
```

Additional logical constraints:

```text
upper_wick = high - max(open, close) >= 0
lower_wick = min(open, close) - low >= 0
```

Violation ⇒ fail OHLC Validation; do not publish as `quality_status=ok`.

## Identity

```text
(instrument_id, timeframe, utc_timestamp)
```

with source lineage retained on raw rows.

## Independence from ticks

Tick and candle stores are independent; ticks are not discarded after bar build.

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


<!-- merged from docs/03-market-data/data-versioning.md -->

# data versioning

## Purpose

Specification for **data versioning** within the 03-market-data domain.

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


<!-- merged from docs/03-market-data/timezone-policy.md -->

# Timezone Policy

## Purpose

Govern how source times become UTC and how session/market dates are assigned.

## Principles

1. **Preserve source evidence** — never overwrite source clocks with only UTC.
2. **One policy version per dataset** — session/DST rules are versioned.
3. **Instrument-scoped** — different symbols/brokers may differ.
4. **Explicit DST handling** — transitions are first-class, not ignored.

## Policy Object (logical)

```text
timezone_policy_id
version
broker_server_timezone      # e.g. fixed offset or named zone used by server
dst_rules_ref               # how DST is applied for this broker/server
session_calendar_ref
daily_bar_boundary_rule     # e.g. server-midnight / exchange session end
notes
```

## Effects on Candles

| Concern | Why policy matters |
|---------|-------------------|
| D1/W1/MN1 open | Boundary depends on server/session rules |
| Gap expectedness | Weekend/holiday in **market** calendar, not only UTC calendar |
| Session features | London/NY overlap etc. need session map |
| Reconciliation | Compare like-for-like bar opens |

## Rules

- Changing timezone policy version requires re-evaluation of affected derived bars and gap classifications.
- Canonical storage keys remain `utc_timestamp`; policy affects interpretation and higher-TF derivation.

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


<!-- merged from docs/03-market-data/data-architecture.md -->

# Data Architecture

## Purpose

Define how market data moves from sources into **Canonical** models used by Representation, Analysis, AI and Discovery.

## Principles

- **Data First** — no valid learning without healthy, traceable data.
- **Source diversity, single canonical interface.**
- **Raw retained; Canonical consumed.**
- **Quality before promotion into analysis.**

## Sources

1. MetaTrader 5 (live + historical)
2. External files (Parquet, CSV) via ingestion pipeline

## Layers

```text
Source
  → Ingestion Adapter
  → Raw Store
  → Normalization (timezone, symbol map, units)
  → Data Quality / Gap / Dedup
  → Canonical Store
  → Derived (Features, Labels)
  → Consumers (Analysis, AI, Discovery, Validation)
```

## Canonical Entities

| Entity | Doc |
|--------|-----|
| Instrument | instrument-model.md |
| Tick | ../contracts/data/tick.md |
| Candle | candle-model.md |
| Quote | quote-model.md |
| Timeframe | timeframe-model.md |
| Derived Feature | feature docs / derived-data-model.md |

## Cross-Cutting

- **Lineage:** every canonical batch links to source + sync_run / import_run.
- **Versioning:** schema_version on partitions; instrument metadata_version.
- **Timezone:** all canonical timestamps UTC (`timezone-policy.md`).

## Rules

- Consumers below Representation **must not** parse MT5-specific structures.
- Incomplete quality_status must not silently enter training datasets.
- Discovery and Prediction read Canonical or Feature stores only.

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


<!-- merged from docs/03-market-data/../contracts/data/tick.md -->

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


<!-- merged from docs/03-market-data/duplicate-model.md -->

# duplicate model

## Purpose

Specification for **duplicate model** within the 03-market-data domain.

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


<!-- merged from docs/03-market-data/symbol-model.md -->

# Symbol Model

## Purpose

Clarify **Symbol** (broker-facing name) vs **Instrument** (internal entity).

## Definitions

| Term | Meaning |
|------|---------|
| Symbol | String identifier in a broker/terminal context (`EURUSD`) |
| Instrument | Internal lab entity with stable `instrument_id` and full metadata |

One Instrument ↔ one primary Symbol per broker binding; aliases may exist.

## Binding

```text
(broker, server?, name) → instrument_id
```

## Selection

Symbols enter the lab only through **symbol selection** configuration + discovery (Market Watch / available list). Selecting a symbol:

1. Resolves or creates Instrument metadata snapshot
2. Enables sync for configured timeframes (per timeframe policy)
3. Does **not** by itself open a GUI chart (see Chart Management)

## Rules

- Never key long-term storage partitions only by mutable display name without catalog mapping to `instrument_id`.
- `canonical_name` is for analytics joins; storage paths may use broker `name` for operator clarity if catalog maps correctly.

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


<!-- merged from docs/03-market-data/derived-data-model.md -->

# derived data model

## Purpose

Specification for **derived data model** within the 03-market-data domain.

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


<!-- merged from docs/03-market-data/live-data-model.md -->

# live data model

## Purpose

Specification for **live data model** within the 03-market-data domain.

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


<!-- merged from docs/03-market-data/quote-model.md -->

# quote model

## Purpose

Specification for **quote model** within the 03-market-data domain.

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


<!-- merged from docs/03-market-data/gap-model.md -->

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


<!-- merged from docs/03-market-data/data-lineage.md -->

# data lineage

## Purpose

Specification for **data lineage** within the 03-market-data domain.

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


<!-- merged from docs/03-market-data/quote-semantics.md -->

# Quote Semantics

## Bid / Ask

- `bid` and `ask` are distinct; mid is derived when needed: `(bid+ask)/2` with explicit policy for missing side.
- **Consistency:** prefer `ask >= bid`; violations → quality flag / quarantine (data anomaly), not silent accept.

## Tick flags

Source flags (if provided by MT5/broker) preserved on raw ticks: trade vs quote, buy/sell aggressor when available, etc.

## Ordering

Canonical order by `(instrument_id, utc_timestamp, sequence/tick_id)`. Out-of-order arrivals buffered/reconciled; never assume network order equals market order.

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


<!-- merged from docs/03-market-data/timeframe-model.md -->

# Timeframe Model

## Enum (logical codes)

```text
TICK
M1 M2 M3 M4 M5 M6 M10 M12 M15 M20 M30
H1 H2 H3 H4 H6 H8 H12
D1 W1 MN1
```

## Admission Rule

Only timeframes that the **source actually provides** or that the lab can **canonically derive** (per timeframe policy) may enter storage/pipelines.

## Canonical policy (reminder)

- Default store: M1 (+ selective TICK)
- Higher TF: derive by default; source-native exception when required

## Rules

- Unknown codes rejected at schema validation.
- MT5 enum mapping lives in the adapter, not scattered in engines.

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


<!-- merged from docs/03-market-data/market-calendar.md -->

# Market Calendar

## Purpose

Versioned calendars of sessions, weekends, and holidays used for gap classification and session features.

## Contents

- Weekly closed intervals (e.g. FX weekend)
- Holiday lists (exchange/broker relevant)
- Optional intraday session segments
- Valid-from / valid-to for rule changes

## Rules

- Gap detection **requires** a calendar reference.
- Calendar id + version appear in sync_run and dataset manifests.

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


<!-- merged from docs/03-market-data/data-quality.md -->

# Data Quality

## Purpose

**Quality before AI.** Corrupted data must not reach Analysis, Training, Discovery, or Inference as if it were clean.

## Pipeline (normative)

```text
Raw
 ↓
Schema Validation
 ↓
Timestamp Validation
 ↓
Duplicate Detection
 ↓
Gap Detection
 ↓
OHLC Validation
 ↓
Price Validation
 ↓
Volume Validation
 ↓
Cross-Timeframe Validation
 ↓
Canonical
```

## Rules

- Fail or quarantine at the earliest stage; do not silently “fix” and promote.
- `quality_status` on canonical rows: `ok | suspect | rejected | gap_filled | quarantined`
- AI/Discovery consumers read only rows allowed by policy (default: `ok`, optionally `suspect` for research-only).

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


<!-- merged from docs/03-market-data/historical-data-model.md -->

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


<!-- merged from docs/03-market-data/source-precedence.md -->

# Source Precedence (deterministic)

```text
1 Primary source (e.g. live MT5 for that instrument)
2 Secondary source
3 Import source (CSV/Parquet bulk)
4 Diagnostic source
```

Conflicts: higher wins for canonical publish; lower quarantined or stored as alternate origin with audit. Never silent mix.

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


<!-- merged from docs/03-market-data/forex-model.md -->

# forex model

## Purpose

Specification for **forex model** within the 03-market-data domain.

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


<!-- merged from docs/03-market-data/crypto-model.md -->

# crypto model

## Purpose

Specification for **crypto model** within the 03-market-data domain.

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


<!-- merged from docs/03-market-data/instrument-types.md -->

# instrument types

## Purpose

Specification for **instrument types** within the 03-market-data domain.

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


<!-- merged from docs/03-market-data/asset-class-model.md -->

# asset class model

## Purpose

Specification for **asset class model** within the 03-market-data domain.

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


<!-- merged from docs/03-market-data/spread-model.md -->

# spread model

## Purpose

Specification for **spread model** within the 03-market-data domain.

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

