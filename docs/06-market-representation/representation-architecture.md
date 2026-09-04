---
id: DOC-PATH-06-MARKET-REPRESENTATION-REPRESENTATION-ARCHITECTURE-MD
title: Representation Architecture
status: draft
version: 0.2
phase: 0
domain: 06-market-representation
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-DATA-001]
related: [DOC-REPR-002, DOC-REPR-011, DOC-ANLY-001]
---

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
