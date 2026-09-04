---
id: DOC-CONV-007
title: Open Question Ownership
status: reviewed
version: 0.2
phase: 0
domain: conventions
updated: 2026-09-04
---

# Open Questions (BUG-REPO-P0-003)

Each open question records:

```text
owner
decision_deadline
impact
default_decision
status
```

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

