---
id: DOC-SYNC-007
title: Duplicate Prevention
status: draft
version: 0.2
phase: 0
domain: 05-synchronization
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-DATA-007, DOC-DATA-003]
related: [DOC-MT5-011]
---

# Duplicate Prevention

## Purpose

Prevent double-insert corruption of datasets.

## Composite Key (bars)

Minimum identity for dedupe:

```text
source
broker
symbol / instrument_id
timeframe
timestamp (utc_timestamp)
```

**Not** timestamp alone.

## Ticks

```text
source + broker + instrument_id + utc_timestamp (+ sequence / tick_id when available)
```

## Live Collector

Effectively-once publish:

- If the same key arrives twice → dedupe; no second canonical row.
- Prefer upsert / ignore-duplicate on publish path.

## Rules

- Double insert must not inflate volume or create conflicting OHLC for the same key.
- Conflicts (same key, different OHLC) escalate to reconciliation/quarantine.
