---
id: DOC-STOR-014
title: Storage Architecture
status: reviewed
version: 0.5
phase: 0
domain: 04-storage
---

# Boundaries

SQLite = control plane · Parquet = canonical history · DuckDB = analytics

Lifecycle dirs: see [data-lifecycle-layout.md](data-lifecycle-layout.md)  
Revisions: see [revision-policy.md](revision-policy.md)

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

