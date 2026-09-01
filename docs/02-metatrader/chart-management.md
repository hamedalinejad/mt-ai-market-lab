---
id: DOC-MT5-005
title: Chart Management
status: draft
version: 0.2
phase: 0
domain: 02-metatrader
created: 2026-09-01
updated: 2026-09-01
depends_on: [DOC-MT5-009, DOC-MT5-015]
related: [ADR-0008]
---

# Chart Management

## Purpose

Clarify the requirement “open chart for selected symbols” against actual MT5 APIs.

## API Reality

- Python `symbol_select()` puts a symbol into **Market Watch**; it does **not** equal MQL5 `ChartOpen()`.
- MQL5 provides `ChartOpen(symbol, timeframe)` for GUI charts inside the terminal.

Therefore “open chart” is **not** a pure Python MetaTrader5 package feature.

## Architecture Options

### Option A — Chart via MQL5 (preferred for current requirements)

```text
Python Controller
       ↓  (command / file / socket / EA input)
MT5 Terminal
       ↓
MQL5 EA / Script
       ↓
ChartOpen(symbol, timeframe)
```

- Lab requests chart open/close through a controlled bridge.
- EA validates symbol exists and respects max chart limits.
- Python remains source of truth for *which* symbols are selected for data; EA is executor for GUI.

### Option B — No GUI chart dependency

```text
symbol_select + data acquisition + internal lab visualization
```

- No ChartOpen at all.
- Operators use Market Watch + lab dashboards.

## Decision Direction (Phase 0)

**Prefer Option A** when the operator requirement explicitly includes terminal charts for selected symbols.

Option B remains acceptable if GUI charts are dropped from scope.

## Rules

- Chart open failure must **not** block data sync or live collection.
- Chart management is **Presentation/Operator convenience**, not part of Signal/Execution correctness.
- Bridge protocol (files, sockets, custom events) is an implementation detail behind `integration-boundary.md`.

## Open Questions

- Max concurrent charts policy
- Whether EA auto-attaches templates/indicators (out of scope for Data First core)
