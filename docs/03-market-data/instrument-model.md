---
id: DOC-DATA-015
title: Instrument Model
status: reviewed
version: 0.3
phase: 0
domain: 03-market-data
---

# Instrument Model

## Canonical identity
```text
instrument_id          # stable ULID/UUID
broker_id
server_id              # multi-server explicit
broker_symbol
canonical_asset_identity  # policy-normalized asset key for cross-broker joins
```

## Metadata
digits, point, tick_size, contract_size, volume_min/max/step, currencies, session_definition, timezone, **metadata_version** (required on material change)

## canonical_name algorithm (policy v1)
1. Uppercase broker symbol
2. Strip known suffixes (`m`, `.pro`, `.raw`, …) via versioned suffix table
3. Map aliases via registry table
4. Result stored; not recomputed ad hoc in engines

## Multi-server
Same broker_symbol on different server_id ⇒ **different** instrument_id bindings unless explicitly merged by operator registry rule.
