---
id: DOC-STOR-016
title: SQLite WAL Policy
status: draft
version: 0.2
phase: 0
domain: 04-storage
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-STOR-014]
related: [DOC-STOR-017]
---

# SQLite WAL Policy

For metadata/state DB:

```text
checkpoint policy
busy timeout
transaction policy
backup policy
recovery
```

WAL sidecar files must be included correctly in backup/copy procedures.

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

