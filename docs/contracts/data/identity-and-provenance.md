---
id: DOC-CONTRACT-DATA-identity-prov
title: Data Identity and Provenance
status: approved
version: 1.0
phase: 0
domain: contracts
created: 2026-09-04
updated: 2026-09-04
---

# Final Data Identity Model

## Instrument (minimum)

```text
instrument_id, broker_id, server_id, broker_symbol, canonical_name,
asset_class, price_precision, volume_precision, contract metadata, metadata_version
```

Broker symbol string alone is **not** a global stable identity.

## Series identity

- Candle: `(instrument_id, timeframe, open_time_utc)`
- Tick: must distinguish repeated timestamps + source-native identity; **timestamp alone insufficient**

## Provenance (every canonical row)

```text
source, origin, ingestion_batch_id,
source_timestamp when available,
availability_time_utc when required,
processing_time_utc,
policy/version identifiers,
quality_status
```
