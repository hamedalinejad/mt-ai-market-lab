---
id: DOC-TEST-003
title: Failure Injection
status: reviewed
version: 0.5
phase: 0
domain: 30-testing
---

# Mandatory failure scenarios

MT5 disconnect/timeout, invalid symbol, missing history, duplicate tick, corrupt candle, DB lock/corruption, disk full, publish crash, model load/degrade, discovery explosion, memory pressure, execution timeout, order rejection, partial fill, process crash, restart during sync/publish, restart after order send before ack

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

