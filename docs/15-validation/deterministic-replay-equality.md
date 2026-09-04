---
id: DOC-VAL-029
title: Deterministic Replay Equality Policy
status: approved
version: 0.2
phase: 0
domain: 15-validation
updated: 2026-09-04
---

# Deterministic Replay Equality (BUG-TEST-P0-003)

“Same result” must declare equality policy:

```text
bitwise equality
tolerance equality
event equality
trade sequence equality
metric equality
```

Each replay test pins which policy applies per assertion class.

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

