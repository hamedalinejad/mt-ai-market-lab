---
id: DOC-SYNC-004
title: Gap Classification
status: draft
version: 0.2
phase: 0
domain: 05-synchronization
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-DATA-013, DOC-MT5-012]
related: [DOC-SYNC-003, DOC-SYNC-009]
---

# Gap Classification

## Purpose

Assign each detected gap a **class** that drives repair policy and health status.

## Official Classes

```text
Gap
├── expected_market_closure   # e.g. FX weekend
├── holiday                   # calendar holiday
├── session_break             # scheduled intraday/session gap
├── source_missing            # market should be open; source has no data
├── transport_failure         # API/terminal/network failure window
├── storage_failure           # local write/read failure window
├── corrupt_data              # present but fails integrity / OHLC conflict
└── unknown                   # needs human or further rules
```

## Classification Inputs

1. Session calendar (versioned)
2. Timezone / broker-time policy
3. Sync run errors (transport)
4. Storage layer errors
5. Reconciliation conflicts (same ts, different OHLC)

## Actions by Class

| Class | Default action |
|-------|----------------|
| expected_market_closure / holiday / session_break | Accept; record gap; no backfill required |
| source_missing | Backfill from source; if still missing → remain open/error |
| transport_failure | Retry sync; do not accept as market closure |
| storage_failure | Repair local; re-verify |
| corrupt_data | Quarantine; reconcile against source; repair or reject |
| unknown | Escalate to health/ops; do not silently ignore |

## Rules

- Friday→Monday FX hole **must not** be classified as `source_missing` solely because UTC calendar shows intervening days.
- Classification is deterministic given calendar + policy version + evidence.
