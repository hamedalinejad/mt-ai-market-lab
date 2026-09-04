---
id: DOC-SCHEMA-event
title: Event Schema
status: reviewed
version: 0.6
phase: 0
domain: contracts
---

# Event Schema

Physical encoding of event-envelope fields. Append-only store. payload JSON with payload_schema_version.

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

