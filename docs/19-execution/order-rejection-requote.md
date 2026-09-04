---
id: DOC-EXEC-017
title: Rejection Requote Partial Fill
status: draft
version: 0.2
phase: 0
domain: 19-execution
created: 2026-09-02
updated: 2026-09-02
depends_on: [DOC-EXEC-001]
related: [DOC-EXEC-011]
---

# Rejection / Requote / Partial Fill

Execution state machine must handle reject, requote, partial fill, timeout→reconcile. No blind resend without idempotent intent.

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

