---
id: DOC-MT5-017
title: Connection Contract
status: reviewed
version: 0.2
phase: 0
domain: 02-metatrader
---

# Connection State Machine

```text
DISCONNECTED → CONNECTING → CONNECTED
                    ↓
               DEGRADED ↔ RECONNECTING
                    ↓
                 FAILED
```

Transitions emit events. FAILED → Safe Mode / alert per policy. Reconnect uses backoff (ops retry policy).

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

