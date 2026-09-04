---
id: DOC-SCHEMA-parquet
title: Parquet Canonical Schema
status: reviewed
version: 0.6
phase: 0
domain: contracts
---

# Parquet Canonical

Partitioned market/feature datasets. Columns align with data contracts (tick/candle/feature). Manifest required per publish. Immutable files after publish.

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

