---
id: DOC-TKNW-003
title: Candlestick Patterns
status: draft
version: 0.2
phase: 0
domain: 08-trading-knowledge
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-REPR-002]
related: [DOC-DISC-014, DOC-TKNW-009]
---

# Candlestick Patterns (Known Catalog)

## Purpose

Catalog **Level-1 Known Patterns** as explicit definitions over Candle Representation.

## Examples (non-exhaustive)

| Pattern | Geometric intent (must be formalized) |
|---------|--------------------------------------|
| Doji | Very small body_ratio |
| Hammer | Small body, long lower_wick, short upper_wick, location rules |
| Engulfing | Two-candle body containment + direction opposition |
| Morning Star | Three-candle sequence with defined middle weakness |

Each pattern entry requires:

- `pattern_id`, version
- Boolean predicate over 1..N candle representations
- Optional context preconditions (trend/session)
- References to literature/taxonomy (not proof of edge)

## Rules

- Known ≠ profitable. Catalog is Knowledge of **definitions**, not Validation of expectancy.
- Implementations must use shared Representation fields, not one-off OHLC code.
