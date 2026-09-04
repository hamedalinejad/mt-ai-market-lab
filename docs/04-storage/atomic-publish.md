---
id: DOC-STOR-027
title: Atomic Publish
status: approved
version: 0.2
phase: 0
domain: 04-storage
---

# Atomic Publish (binding order)

```text
1 write to staging
2 validate (schema + invariants + quality)
3 checksum
4 publish (move/commit into canonical location)
5 update sync_state / manifest
```

**Forbidden:** advance `last_persisted` before successful publish+validate.

Crash between 1–4 ⇒ restart from last committed publish; staging cleaned or resumed per job id.

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

