---
id: DOC-CONTRACT-DB-001
title: SQLite Logical Schema
status: draft
version: 0.2
phase: 0
domain: contracts
---

# SQLite Logical Schema (Metadata / State)

## Tables (minimum)

### instrument
PK: instrument_id  
UK: (broker, name)

### sync_state
PK: (instrument_id, timeframe, source)  
Fields: last_seen, last_persisted, first_available, expected_next, status, gap_count, last_error, policy_versions, updated_at

### gap
PK: gap_id  
FK: instrument_id  
Indexes: (instrument_id, timeframe, start_utc)

### model_registry
PK: model_version  
Fields: status, parent, feature_set_id, paths, metrics_json, created_at

### experiment
PK: experiment_id  
Indexes: hypothesis_id, status

### hypothesis
PK: hypothesis_id

### knowledge_node / knowledge_edge
PK: id; edges FK endpoints

### signal
PK: signal_id; Index status, instrument_id, created_at

### order_intent
PK: intent_id; UK: client_order_id  
Fields: execution_state, broker_ticket?

### event_log
PK: event_id — **append-only**

### config_version
PK: config_version

## Constraints

- FK where referential integrity required
- UK on idempotency keys (client_order_id, sync_state composite)
- Indexes on time range queries for gaps/signals

## Migration policy

Forward migrations versioned; never silent destructive change without backup.

## Acceptance Criteria

```text
AC-01
Given this document is binding for its domain
When an implementer builds against it
Then behavior must satisfy the stated invariants and contracts herein
And violations fail validation or static gates before promotion
```

```text
AC-02
Given status is not approved
When production code for this scope is proposed
Then it must be rejected until status reaches approved
```

