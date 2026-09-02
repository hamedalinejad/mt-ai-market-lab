---
id: DOC-MT5-011
title: Live Feed
status: draft
version: 0.2
phase: 0
domain: 02-metatrader
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-MT5-009]
related: [DOC-SYNC-007, DOC-SYNC-013, DOC-OPS-001]
---

# Live Feed

## Purpose

Near-live pull collector (not assumed full broker push stream).

## Effectively-Once

If a tick/bar arrives twice:

```text
tick_id / (timestamp + sequence) / composite bar key
```

→ **dedupe**, never double-insert into canonical stores.

## Cursor Safety

```text
last_persisted advances only after durable publish + validation
```

After crash at tick 100000, restart continues from last persisted (e.g. 99998), not from an in-memory counter.

## Rules

- Live Collector is Resource-aware and health-reported.
- Historical gaps are Sync/Backfill, not Live.
