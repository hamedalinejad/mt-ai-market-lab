---
id: DOC-CONTRACT-DATA-identity
title: Logical vs Source Identity
status: reviewed
version: 0.3
phase: 0
domain: contracts
updated: 2026-09-04
---

# Identity Layers (BUG-P0-012)

## Logical identity (canonical series)
```text
(instrument_id, timeframe?, event_time_utc [, sequence])
```

## Source identity (independent)
```text
source_id
source_kind          # mt5 | csv | parquet | replay | …
broker
server
feed
account_context
schema_version
retrieved_at
```
Plus source symbol / source timestamps as applicable.

## Why
Two brokers may disagree on EURUSD prints. Logical series is lab truth after quality; source identity preserves provenance and multi-broker coexistence.
