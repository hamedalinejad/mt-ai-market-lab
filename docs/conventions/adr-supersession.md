---
id: DOC-CONV-008
title: ADR Supersession
status: reviewed
version: 0.2
phase: 0
domain: conventions
updated: 2026-09-04
---

# ADR Supersession (BUG-REPO-P0-004)

When a decision changes:

```text
old ADR → deprecated
superseded_by
reason
migration_impact
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

