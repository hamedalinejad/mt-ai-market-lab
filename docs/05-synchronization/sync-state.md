---
id: DOC-SYNC-013
title: Sync State
status: reviewed
version: 0.4
phase: 0
domain: 05-synchronization
---

# Sync State Schema (binding)

## Table `sync_state`
```text
instrument_id
timeframe
source
last_seen          # last observed from provider
last_persisted     # durable canonical watermark
first_available
expected_next
status             # uninitialized|idle|backfilling|live|error|…
gap_count
last_error
policy_versions    # timezone/session/tf policy ids
updated_at
```
PK: `(instrument_id, timeframe, source)`
