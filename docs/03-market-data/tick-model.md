---
id: DOC-DATA-024
title: Tick Model
status: draft
version: 0.2
phase: 0
domain: 03-market-data
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-DATA-001, DOC-DATA-022]
related: [DOC-DATA-003, DOC-STOR-009]
---

# Tick Model

## Purpose

Ticks are a **first-class dataset**, not disposable scaffolding for bars.

## Uses

```text
spread analysis
microstructure
slippage
liquidity
execution
anomaly
volatility
price formation
```

## Independence

Tick store and Candle store are **independent** canonical series. Bars may be derived from ticks under a versioned definition, but ticks are retained per retention policy.

## Tiering (laptop)

```text
Hot:   Recent ticks
Warm:  Recent bars
Cold:  Historical compressed ticks
```

## Rules

- Selective symbol enable for tick ingestion (resource-aware).
- Quality flags: duplicate, crossed book, gap classification when applicable.
