---
id: DOC-PROJ-020
title: Requirements Catalog Index
status: reviewed
version: 0.2
phase: 0
domain: 00-project
updated: 2026-09-04
---

# Remaining / Canonical Requirements Index

Binding detail lives under `docs/contracts/` and domain P0 docs. This catalog lists IDs that must remain covered before code for each area.

## DATA (REQ-DATA-001…016)
Identity, Time, Tick, Quote, Candle, Calendar, Session, DST, Revision, Gap, Quarantine, Provenance, Quality, Dedup, Source precedence, Retention

## STORAGE (REQ-STOR-001…012)
Raw immutable, Canonical reproducible, Atomic publish, Manifest, Checksum, Snapshot, Partition benchmark, Compression benchmark, Compaction, Corruption detection, Backup, Restore drill

## SYNC (REQ-SYNC-001…011)
Cursor per instrument×TF×source, Crash-safe tx, Bounded backoff, Rate limit, Reconnect, Backfill schedule, Live tail, Gap resolver, Revision detector, Audit log, No duplicate cursor advance

## MT5 (REQ-MT5-001…011)
Connection lifecycle, Terminal, Account context, Symbol discovery/selection, Tick polling, Historical rates, Chart command, Broker/server id, TF mapping, API error taxonomy

## FEATURE / LABEL / MODEL / LEARNING / DISCOVERY / KNOWLEDGE / SIGNAL / STRATEGY / RISK / EXECUTION / MODES / RESOURCE / OBSERVABILITY / SECURITY
See domain contracts and prior P0 fixes; feature fields must include feature_id, version, inputs, operator, window, lag, decision_time, availability_time, units, null/NaN/clip/normalization policies, provenance; online/offline parity; no future normalization.

Continuous learning ≠ continuous promotion. Failure Memory is an asset. Discovery layers: Search → Scientific evaluation → Knowledge promotion. Negative knowledge required. Risk outputs ALLOW|REDUCE|DENY|HALT. Execution idempotent and reconcilable.

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

