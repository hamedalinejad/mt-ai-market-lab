---
id: DOC-DATA-022
title: Timestamp Model
status: reviewed
version: 0.7
---

Binding: docs/contracts/data/time-fields.md

Clocks: source_timestamp, source_timezone, event_time_utc, availability_time_utc, ingestion_time_utc, processing_time_utc.
availability_time_utc authoritative for ML leakage.

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

