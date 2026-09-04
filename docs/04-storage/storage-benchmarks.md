---
id: DOC-PATH-04-STORAGE-STORAGE-BENCHMARKS-MD
title: Storage Benchmarks
status: draft
version: 0.2
phase: 0
domain: 04-storage
created: 2026-09-01
updated: 2026-09-02
depends_on: [ADR-0004]
related: [DOC-TEST-004]
---

# Storage Benchmarks

Required scenarios before locking storage tech:

```text
1M / 10M / 100M rows
random read | range read
append | upsert
compression
concurrent read
recovery
disk usage
```

Results feed ADR-0004 decision, not intuition.

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

