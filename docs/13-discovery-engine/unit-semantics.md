---
id: DOC-DISC-025
title: Unit / Semantic Types
status: reviewed
version: 0.2
phase: 0
domain: 13-discovery-engine
updated: 2026-09-04
---

# Unit Semantics (BUG-DISC-P0-003)

Expressions are typed. Example **invalid** unless explicit cast policy exists:

```text
price + volatility
```

Semantic types (examples): price, return, volatility, volume, dimensionless, boolean, time_lag.

Type checker runs before evaluation; violations → reject candidate generation.

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

