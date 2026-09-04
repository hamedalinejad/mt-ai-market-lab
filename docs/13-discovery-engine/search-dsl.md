---
id: DOC-DISC-024
title: Search DSL
status: reviewed
version: 0.2
phase: 0
domain: 13-discovery-engine
updated: 2026-09-04
---

# Search DSL (BUG-DISC-P0-002)

Versioned `grammar_version` defines:

```text
grammar / productions
literals
typing
units / semantic types
allowed depth
invalid expressions catalog
```

## Runtime safety (must reject or safe-fail)
```text
division by zero
log of negative
sqrt of negative
overflow
NaN propagation
```

Invalid expressions never become promotable candidates.

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

