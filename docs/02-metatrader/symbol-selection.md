---
id: DOC-MT5-015
title: Symbol Selection
status: reviewed
version: 0.4
phase: 0
domain: 02-metatrader
---

# Symbol Lifecycle States

```text
discovered → selected → verified → available
disabled (orthogonal / terminal state)
```

| State | Meaning |
|-------|---------|
| discovered | seen via symbols_get / scan |
| selected | in operator config allowlist |
| verified | metadata snapshot ok |
| available | Market Watch + data path ready |
| disabled | explicitly off |

Pipelines only on **available** (unless research override).

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

