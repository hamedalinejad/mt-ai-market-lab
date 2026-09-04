---
id: DOC-STOR-024
title: Compaction Engine
status: reviewed
version: 0.3
phase: 0
domain: 04-storage
---

# Compaction Policy

| Item | Requirement |
|------|-------------|
| trigger | file count / size threshold / schedule (resource-aware) |
| target file size | versioned policy |
| row group size | versioned policy |
| concurrent readers | old files readable until cutover; readers use manifest |
| recovery | compaction job id; partial failure leaves prior manifest active |

Never blocks P0 live path under Emergency / Safe Mode.

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

