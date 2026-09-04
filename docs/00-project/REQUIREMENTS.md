---
id: DOC-PROJ-031
title: Requirements System
status: reviewed
version: 0.2
phase: 0
domain: 00-project
updated: 2026-09-04
---

# Requirements (R-001)

Each requirement must have:

```text
requirement_id
source
owner
status
acceptance_criteria
downstream_specs[]
```

Catalog index: [requirements-catalog.md](requirements-catalog.md)  
Traceability: [TRACEABILITY.md](TRACEABILITY.md)

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


<!-- merged from docs/00-project/TRACEABILITY.md -->

# Traceability Matrix (skeleton)

| Requirement | Contract | Spec | ADR | Test | Evidence |
|-------------|----------|------|-----|------|----------|
| REQ-DATA-* | docs/contracts/data | domain 03/04/05 | ADR storage/MT5 | contract/data tests | TBD |
| REQ-SYNC-* | sync interfaces | 05-synchronization | — | recovery tests | TBD |
| REQ-AI-* | model/prediction | 10/12 | ADR AI | model tests | TBD |
| REQ-DISC-* | discovery candidate | 13 | — | discovery tests | TBD |
| REQ-VAL-* | validation | 15 | — | leakage/static | TBD |
| REQ-TRD-* | signal/risk/order | 16–19 | — | execution tests | TBD |
| REQ-OPS-* | modes/ops | 21/28 | — | recovery | TBD |

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


<!-- merged from docs/00-project/requirements-catalog.md -->

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

