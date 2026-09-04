---
id: DOC-REPR-MERGED-001
title: representation
status: reviewed
phase: 0
created: 2026-09-04
updated: 2026-09-04
depends_on: []
related: []
---
> **Note:** Domain narrative consolidated from multiple former files. Binding contracts remain under `docs/contracts/`. Sections marked TBD are not Phase-0 binding.


# representation


<!-- merged from docs/06-market-representation/market-dna-fingerprint.md -->

# market dna fingerprint

## Purpose

Specification for **market dna fingerprint** within the 06-market-representation domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/06-market-representation/trend-representation.md -->

# trend representation

## Purpose

Specification for **trend representation** within the 06-market-representation domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/06-market-representation/price-action-representation.md -->

# price action representation

## Purpose

Specification for **price action representation** within the 06-market-representation domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/06-market-representation/cross-timeframe-representation.md -->

# cross timeframe representation

## Purpose

Specification for **cross timeframe representation** within the 06-market-representation domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/06-market-representation/representation-architecture.md -->

# Representation Architecture

## Purpose

Convert Canonical Market Data into analysis-ready structures without embedding strategy logic.

## Pipeline

```text
Canonical Candle/Tick
  → Candle Representation
  → Sequence Representation
  → Market State / Regime / Structure
  → Cross-Timeframe / Cross-Market context
  → Feature consumers (Analysis, AI, Discovery)
```

## Separation

- Representation **does not** emit Signals or Orders.
- Known pattern labels may be attached as optional annotations (Analysis/Knowledge), still Candidates until Validation when used for trading claims.


<!-- merged from docs/06-market-representation/volume-representation.md -->

# volume representation

## Purpose

Specification for **volume representation** within the 06-market-representation domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/06-market-representation/volatility-representation.md -->

# volatility representation

## Purpose

Specification for **volatility representation** within the 06-market-representation domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/06-market-representation/liquidity-representation.md -->

# liquidity representation

## Purpose

Specification for **liquidity representation** within the 06-market-representation domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/06-market-representation/candle-representation.md -->

# Candle Representation

## Purpose

Define a **rich candle object** beyond raw OHLC. “Knowing candles” means structured geometry, relative measures, and **context** — not only Open/High/Low/Close fields.

## Layers

```text
Raw OHLC (+ volume/spread)
        ↓
Geometric features
        ↓
Relative / normalized features
        ↓
Contextual features (session, volatility, trend, MTF, …)
        ↓
Pattern inputs (single / multi / sequence / contextual)
```

## Geometric Fields (per candle)

| Field | Definition (logical) |
|-------|----------------------|
| `body` | \|close − open\| |
| `upper_wick` | high − max(open, close) |
| `lower_wick` | min(open, close) − low |
| `range` | high − low |
| `direction` | up \| down \| flat (policy for flat epsilon) |
| `body_ratio` | body / range (0 if range=0; handle div-by-zero) |
| `upper_wick_ratio` | upper_wick / range |
| `lower_wick_ratio` | lower_wick / range |
| `wick_ratio` | (upper_wick + lower_wick) / range |
| `close_position` | (close − low) / range ∈ [0,1] |
| `open_position` | (open − low) / range ∈ [0,1] |

## Relation Fields

| Field | Definition |
|-------|------------|
| `gap` | Relation to previous close (gap up/down/none + size) |
| `true_range` | Classic TR vs prior close |
| `relative_range` | range vs rolling reference (e.g. range / ATR or percentile) |

## Context Fields (attached or joinable)

| Context | Examples |
|---------|----------|
| `volatility_context` | ATR regime, realized vol bucket, compression/expansion |
| `volume_context` | relative tick_volume vs baseline |
| `spread_context` | spread vs typical spread |
| `session_context` | session segment, TOD features, day-of-week |
| `trend_context` | local trend state, structure bias |
| `multi_timeframe_context` | higher-TF direction/location (from MTF representation) |

Context may be stored denormalized on feature rows or joined at analysis time; contract must name versions of each context definition.

## Encoding for ML / Discovery

- Numeric vector schema versioned as `candle_repr_version`
- Categorical direction/session encoded explicitly
- Missing context → explicit null/mask, not silent zero

## Rules

- Representation is **derived** from canonical candles + policy versions (timezone, session, ATR length, …).
- Pattern detectors consume Representation, not ad-hoc OHLC math duplicated per module.
- Zero-range candles are first-class edge cases (doji-like geometry).

## Open Questions

- Default windows for relative_range / volume baselines
- Whether to persist full context on every bar or compute online


<!-- merged from docs/06-market-representation/structure-representation.md -->

# structure representation

## Purpose

Specification for **structure representation** within the 06-market-representation domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/06-market-representation/market-regime-representation.md -->

# market regime representation

## Purpose

Specification for **market regime representation** within the 06-market-representation domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/06-market-representation/temporal-representation.md -->

# temporal representation

## Purpose

Specification for **temporal representation** within the 06-market-representation domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD

