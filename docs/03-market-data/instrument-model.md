---
id: DOC-DATA-015
title: Instrument Model
status: reviewed
version: 0.4
phase: 0
domain: 03-market-data
updated: 2026-09-04
---

# Instrument Canonicalization (BUG-P0-013)

## Symbols that may differ
`EURUSD`, `EURUSDm`, `EURUSD.a`, `EURUSD.raw`, …

## Versioned mapping policy
```text
raw_broker_symbol
broker_family
server
canonical_instrument_family   # conceptual asset family
tradable_instrument_id        # instrument_id used in pipelines
```

Mapping table is **versioned** (`instrument_map_version`). Engines never ad-hoc string-strip without policy version.

## Identity
`instrument_id` stable ULID/UUID per tradable binding (broker+server+symbol unless operator merge rule).
`metadata_version` increments on material metadata change.

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

