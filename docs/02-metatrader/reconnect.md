---
id: DOC-MT5-013
title: Reconnect
status: draft
version: 0.2
phase: 0
domain: 02-metatrader
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-MT5-009]
related: [DOC-OPS-003, DOC-SYNC-013]
---

# MT5 Reconnect

Retry with backoff; after reconnect: verify symbols, sync from last_persisted, reconcile orders/positions if execution enabled. Do not assume in-memory state survived.

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

