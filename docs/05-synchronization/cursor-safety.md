---
id: DOC-SYNC-015
title: Cursor Safety Transaction Protocol
status: reviewed
version: 0.7
phase: 0
---

# Protocol

REQUEST → DOWNLOAD → RAW WRITE → RAW VALIDATE → CANONICAL TRANSFORM → CANONICAL VALIDATE → ATOMIC PUBLISH → CONTROL-PLANE COMMIT → CURSOR ADVANCE

Forbidden: DOWNLOAD → CURSOR ADVANCE → crash

Failure codes per stage: SYNC_BAD_RANGE, PROVIDER_TIMEOUT, STORAGE_FULL, RAW_SCHEMA_FAIL, OHLC_INVARIANT, PUBLISH_FAIL, STATE_COMMIT_FAIL, …

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

