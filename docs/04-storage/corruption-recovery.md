---
id: DOC-STOR-019
title: Data Corruption Recovery
status: draft
version: 0.2
phase: 0
domain: 04-storage
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-STOR-017]
related: [DOC-STOR-020]
---

# Data Corruption Recovery

```text
detect → quarantine → restore → resync → verify
```

Example: corrupted Parquet file.

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

