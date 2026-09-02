---
id: DOC-DISC-006
title: Discovery Space
status: draft
version: 0.2
phase: 0
domain: 13-discovery-engine
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-DISC-001]
related: [DOC-DISC-013, DOC-DISC-008, DOC-DISC-014]
---

# Discovery Space

## Purpose

Versioned search alphabets and **search domains** for systematic discovery.

## Search Domains (program catalog)

```text
01 Pattern Discovery
02 Candle Discovery
03 Sequence Discovery
04 Feature Discovery
05 Indicator Discovery
06 Formula Discovery
07 Relationship Discovery
08 Regime Discovery
09 Anomaly Discovery
10 Signal Discovery
11 Strategy Discovery
12 Cross-Market Discovery
13 Cross-Timeframe Discovery
14 Temporal Discovery
15 Structural Discovery
16 Volatility Discovery
17 Liquidity Discovery
18 Unknown-Structure Discovery
```

Each domain has its own variable/operator constraints, complexity caps, and multiplicity family id.

## Variable Families

Price, Return, Range, Volume, Volatility, Momentum, Distance, Ratio, Geometry, Rank/Quantile, Lag, Cross-TF, Cross-Asset.

## Operator Families

```text
+ - * / abs log sqrt exp min max mean std rank corr lag rolling diff
```

## Rules

- Expanding domains or operators is versioned; affects multiple-testing accounting.
- Cross-market domain **must** enforce leakage controls (availability time per symbol).
