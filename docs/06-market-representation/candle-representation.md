---
id: DOC-REPR-002
title: Candle Representation
status: draft
version: 0.2
phase: 0
domain: 06-market-representation
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-DATA-003, DOC-REPR-001]
related: [DOC-TKNW-003, DOC-DISC-014, DOC-FEAT-003]
---

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
