---
id: DOC-SYNC-011
title: Sync Architecture
status: draft
version: 0.2
phase: 0
domain: 05-synchronization
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-STOR-014, DOC-MT5-008, DOC-SYNC-013]
related: [DOC-SYNC-009, DOC-SYNC-003, DOC-DATA-023]
---

# Sync Architecture

## Purpose

Describe the control plane that keeps local canonical data aligned with sources across restarts and failures.

## Startup Sequence (normative)

```text
LOAD CONFIG
  → CONNECT MT5 (if live mode)
  → DISCOVER / LOAD selected instruments
  → LOAD sync_state
  → COMPARE local vs source (recent window + checkpoints)
  → DETECT gaps
  → CLASSIFY gaps
  → BACKFILL required ranges
  → RECONCILE (including OHLC conflicts)
  → VALIDATE
  → DEDUPLICATE
  → UPDATE sync_state
  → START live collector
```

## Components

| Component | Role |
|-----------|------|
| Sync Planner | Decides ranges to fetch from sync_state + gaps |
| Historical Retriever | Source API batches |
| Live Collector | Incremental follow |
| Normalizer | Broker-time → UTC + identity |
| Quality Gate | Invariants |
| Canonical Writer | Atomic publish |
| Gap Detector / Classifier | Continuity |
| Reconciler | Compare/repair/verify |
| State Store | SQLite sync_state + sync_run |

## Idempotency

Re-running sync for an overlapping range must not duplicate canonical identities. Publish path dedupes on `(instrument_id, timeframe, utc_timestamp)`.

## Timeframe Policy Interaction

- Prioritize **M1** (and selective TICK) sync_state health.
- Higher TF: derive or source-native per timeframe policy; each has its own state row if stored.

## Rules

- Partial failure is recovery-safe: cursors only advance on verified persist.
- Expected gaps do not force error status if classified and accepted.
- Broker-time policy version is stored on sync_state / sync_run.
