---
id: DOC-TEST-006
title: Suite Specification Template
status: reviewed
version: 0.2
phase: 0
domain: 30-testing
---

# Per-Suite Spec (BUG-TEST-P0-001)

Each suite documents:

```text
test cases
fixtures
pass/fail criteria
deterministic seed
failure injection
```

Static gates 1–10: see static-architecture-tests.md  
Replay equality policies: see deterministic-replay-equality.md

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

