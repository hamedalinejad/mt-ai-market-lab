---
id: DOC-PATH-27-RISK-AND-SAFETY-CIRCUIT-BREAKERS-MD
title: Circuit Breakers
status: draft
version: 0.2
phase: 0
domain: 27-risk-and-safety
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-SAFE-001]
related: [DOC-RUN-009, DOC-RISK-013]
---

# System-wide Circuit Breakers

Any of:

```text
Data failure | Model failure | Storage failure
Sync failure | Risk failure | Execution failure
Resource exhaustion
```

may force **Safe Mode**.

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

