---
id: DOC-DATA-023
title: Timeframe Model
status: draft
version: 0.2
phase: 0
domain: 03-market-data
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-DATA-001]
related: [DOC-MT5-003, DOC-STOR-009]
---

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
