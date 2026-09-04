---
id: DOC-CONTRACT-DATA-time
title: Time Fields Contract
status: reviewed
version: 0.7
phase: 0
domain: contracts
updated: 2026-09-04
---

# Data Time Model — locked

```text
source_timestamp
source_timezone
event_time_utc
availability_time_utc
ingestion_time_utc
processing_time_utc
```

**ML/Validation:** `availability_time_utc` dominates for leakage. Feature usable at T only if `availability_time_utc <= T`.

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

