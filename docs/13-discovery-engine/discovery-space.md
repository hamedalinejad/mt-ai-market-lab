---
id: DOC-DISC-006
title: Discovery Space
status: draft
version: 0.2
phase: 0
domain: 13-discovery-engine
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-DISC-001, DOC-REPR-002]
related: [DOC-DISC-008, DOC-DISC-011, DOC-DISC-020]
---

# Discovery Space

## Purpose

Define the searchable alphabet for formulas, features, and parameterized patterns — the prerequisite for real Indicator/Formula Discovery (not a fixed RSI/MACD list).

## Variable Families

| Family | Examples |
|--------|----------|
| Price | open, high, low, close, mid |
| Return | log return, simple return, signed move |
| Range | range, true_range, relative_range |
| Volume | tick_volume, relative volume |
| Volatility | rolling std, ATR-like constructs |
| Momentum | differences, rates of change |
| Distance | distance to rolling mean/max/min |
| Ratio | body_ratio, wick ratios, price ratios |
| Geometry | candle representation fields |
| Rank / Quantile | rolling rank, percentile position |
| Lag | x[t−k] |
| Cross-timeframe | higher/lower TF aggregates |
| Cross-asset | related instrument series (when enabled) |

## Operator Families

```text
+  -  *  /
abs  log  sqrt  exp
min  max  mean  std
rank  corr
lag  rolling  diff
```

Additional operators require explicit registration (numerical stability, cost).

## Structure Axes

```text
Variables × Operators × Transforms × Lags × Windows
× Thresholds × Conditions × Sequences
× Cross-Timeframe × Cross-Symbol × Cross-Market
```

## Constraints (mandatory)

| Constraint | Reason |
|------------|--------|
| Max expression depth | Explosion control |
| Operator whitelist | Stability + interpretability |
| Window set finite | Compute bound |
| Complexity penalty | Prefer simpler Candidates |
| Runtime cost budget | Laptop resource policy |
| Numerical guards | div-by-zero, log≤0, NaN policy |

## Rules

- Search space itself is versioned (`discovery_space_version`).
- Expanding the space is an ADR-worthy change if it affects Validation multiplicity.
