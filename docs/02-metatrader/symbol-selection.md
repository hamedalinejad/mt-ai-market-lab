---
id: DOC-MT5-015
title: Symbol Selection
status: draft
version: 0.2
phase: 0
domain: 02-metatrader
created: 2026-09-01
updated: 2026-09-01
depends_on: [DOC-MT5-014, DOC-DATA-015]
related: [DOC-MT5-005, DOC-CFG-001]
---

# Symbol Selection

## Purpose

Define how symbols enter the lab’s active set.

## Steps

1. **Discover** available symbols from terminal/broker.
2. **Select** subset via configuration (allowlist / groups / rules).
3. **Activate** in Market Watch (`symbol_select`) so history/ticks can be requested.
4. **Snapshot** Instrument metadata (`symbol_info` → Instrument model).
5. **Optional:** request GUI charts via MQL5 bridge (Chart Management Option A).
6. **Enable** sync for canonical timeframes per policy.

## Rules

- Selection is configuration-driven, not hard-coded in engine logic.
- Deselecting a symbol stops live poll and new backfill; existing canonical data is retained per retention policy.
- Selection success ≠ chart open success ≠ full history available.
