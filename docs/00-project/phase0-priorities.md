---
id: DOC-PROJ-011
title: Phase 0 Priorities P0 P1 P2
status: draft
version: 0.2
phase: 0
domain: 00-project
created: 2026-09-02
updated: 2026-09-02
depends_on: [DOC-MASTER-001, DOC-PROJ-010]
related: [DOC-PROJ-012]
---

# Phase 0 Priorities

## Rule

**No production code** until P0 specifications reach Contract → Schema → Interface → Failure Mode → Acceptance Criteria depth (not template-only).

## P0 — must be solved before any code

```text
Data Contracts
Canonical Market Data Model
MT5 Adapter Contract
Historical Data Architecture
Live Data Architecture
Synchronization State Machine
Database / Parquet / DuckDB Architecture
Data Quality & Integrity
Time / Timezone / Session Model
Candle / Tick Semantics
Replay Engine Specification
Feature Contract
Dataset / Label Contract
AI Architecture
Training Pipeline
Online Learning Governance
Model Registry
Discovery Grammar / Search Space
Experiment Architecture
Validation Architecture
Leakage Prevention
Multiple Testing
Signal Contract
Strategy Contract
Risk Contract
Execution Contract
Order Reconciliation
Safety / Circuit Breaker
Resource Budget
Testing Architecture
```

## P1 — after P0 contracts are solid

```text
Cross-market intelligence
Advanced discovery
Unknown structure
Advanced ensembles
Dynamic model weighting
Knowledge graph (deep)
Notifications
UI
External data
Advanced observability
Automated continuous discovery
```

## P2 — not laptop-primary now

```text
Distributed processing
GPU acceleration
Cloud datasets
Multi-machine training
Large-scale experiment orchestration
```

## Decision

Domain folders **00–29** (and 30–40 scaffolds) are retained. Templates must be upgraded to real specifications before implementation.

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

