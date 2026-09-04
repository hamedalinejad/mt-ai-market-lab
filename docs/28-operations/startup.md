---
id: DOC-PATH-28-OPERATIONS-STARTUP-MD
title: Startup Sequence
status: reviewed
version: 0.5
phase: 0
domain: 28-operations
updated: 2026-09-04
created: 2026-09-04
depends_on: []
related: []
---

# Startup Sequence (BUG-OPS-P0-002)

```text
Load config
→ Validate config
→ Acquire lock
→ Open SQLite
→ Run migrations
→ Load registry
→ Check filesystem
→ Check disk space
→ Initialize logging
→ Connect MT5
→ Validate broker/account
→ Reconcile
→ Load model
→ Health checks
→ Enter runtime mode
```

Not `start → run`. Fail closed on integrity errors.

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

