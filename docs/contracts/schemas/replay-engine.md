---
id: DOC-SCHEMA-replay
title: Replay Engine Schema Notes
status: reviewed
version: 0.6
phase: 0
domain: contracts
---

# Replay

Deterministic ordering of envelope events + market data. Seed, dataset pins, checkpoint offsets stored as replay-run metadata.

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

