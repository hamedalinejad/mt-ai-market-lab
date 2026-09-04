---
id: DOC-PATH-30-TESTING-MT5-CONTRACT-TESTS-MD
title: MT5 Contract Tests
status: draft
version: 0.2
phase: 0
domain: 30-testing
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-TEST-001, DOC-MT5-009]
related: []
---

# MT5 Contract Tests

## Cases

```text
MT5 returns expected fields
MT5 timeframe mapping
MT5 symbol metadata
MT5 timestamp semantics
MT5 errors
MT5 reconnect
```

Contracts fail closed when the adapter violates documented schemas/semantics.

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

