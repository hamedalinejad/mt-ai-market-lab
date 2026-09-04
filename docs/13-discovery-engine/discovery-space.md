---
id: DOC-DISC-006
title: Discovery Space
status: reviewed
version: 0.5
phase: 0
domain: 13-discovery-engine
updated: 2026-09-04
---

# Discovery Space

Operator families: variables, operators, constants, windows, conditionals, comparators, boolean, thresholds, aggregation, cross-timeframe, cross-asset.

**Formal DSL:** [search-dsl.md](search-dsl.md)  
**Units:** [unit-semantics.md](unit-semantics.md)

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

