---
id: DOC-STOR-021
title: Writer Policy
status: draft
version: 0.2
phase: 0
domain: 04-storage
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-STOR-016]
related: [DOC-OPS-004]
---

# Writer Policy

## SQLite

**Single-Writer** policy for state DB to avoid lock storms.

## DuckDB

Analytics must not become unbounded multi-writer against the same mutable DB; clear boundary vs ingestion/canonical writers.

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

