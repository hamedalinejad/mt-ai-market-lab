---
id: DOC-ERR-002
title: Retry Policy
status: draft
version: 0.2
phase: 0
domain: contracts
created: 2026-09-02
updated: 2026-09-02
depends_on: [DOC-ERR-001]
---

# Retry Policy

| Situation | Action |
|-----------|--------|
| connection timeout | retry (backoff) |
| invalid symbol | do not retry |
| corrupt data | quarantine |
| database locked | backoff |
| disk full | stop / safe mode |

## Exponential backoff

For MT5, network, external sources, storage contention — with caps and jitter.

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

