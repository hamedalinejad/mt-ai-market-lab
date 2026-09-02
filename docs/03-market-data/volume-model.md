---
id: DOC-DATA-028
title: Volume Model
status: draft
version: 0.2
phase: 0
domain: 03-market-data
created: 2026-09-02
updated: 2026-09-02
depends_on: [DOC-DATA-003, DOC-DATA-024]
---

# Volume Model

## Purpose

Define volume fields for ticks and candles without assuming exchange-quality volume on all FX symbols.

## Candle

- `tick_volume` when broker provides tick volume
- `volume` when real volume available
- Missing volume → null, not zero (unless source explicitly zero)

## Tick

Optional trade size / volume fields when present; quote-only ticks may have null volume.

## Invariants

- Volume >= 0 when present
- Do not invent volume from OHLC alone for promotable features without declaring synthetic definition version
