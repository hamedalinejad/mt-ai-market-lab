---
id: DOC-PATH-28-OPERATIONS-RETRY-POLICY-MD
title: Retry Policy
status: draft
version: 0.2
phase: 0
domain: 28-operations
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-CONTRACT-ERR-001]
related: [DOC-OPS-004]
---

# Retry Policy

Not every error is retried.

| Example | Action |
|---------|--------|
| connection timeout | retry |
| invalid symbol | do not retry |
| corrupt data | quarantine |
| database locked | backoff |
| disk full | stop / Safe Mode |

## Exponential Backoff

For MT5, network, external source, storage contention.

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

