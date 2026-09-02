---
id: DOC-DB-001
title: SQLite Logical Schema
status: draft
version: 0.2
phase: 0
domain: 33-database-schema
---

# SQLite Logical Schema (state / metadata)

**Binding narrative for tables; physical migrations versioned in code later.**

## Tables (minimum)

### instrument
PK instrument_id; name, broker, canonical_name, metadata_version, active

### sync_state
PK (instrument_id, timeframe, source)
last_seen_ts, last_persisted_ts, first_available_ts, expected_next_ts, sync_status, gap_count, last_error, policy_versions, updated_at

### gap
PK gap_id; instrument_id, timeframe, start_utc, end_utc, gap_class, severity, resolution

### model_registry
PK model_version; parent, feature_set_id, status, paths, metrics_json, created_at

### experiment
PK experiment_id; hypothesis_id, pins_json, status, cost_bundle_id

### hypothesis
PK hypothesis_id; status, text_ref

### knowledge_node
PK knowledge_id; type, status; evidence via knowledge_evidence(knowledge_id, evidence_id)

### signal
PK signal_id; instrument_id, status, trace_json, created_at

### order_intent
PK intent_id; UNIQUE client_order_id; execution_state; broker_ticket NULL

### event_log
PK event_id; event_type, ts, payload_json — append-only

## Indexes
sync_state(updated_at); signal(created_at); order_intent(execution_state); event_log(ts)

## Constraints
UNIQUE client_order_id; FK instrument_id where applicable

## Migration policy
Forward-only numbered migrations; never edit applied migration files.
