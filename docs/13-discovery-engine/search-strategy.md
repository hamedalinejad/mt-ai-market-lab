---
id: DOC-DISC-017
title: Search Strategy & Budget
status: reviewed
version: 0.5
phase: 0
domain: 13-discovery-engine
updated: 2026-09-04
---

# Enforceable Search Budget (BUG-DISC-P0-007)

Recorded **before** run and replayable:

```text
wall_clock
CPU
RAM
candidate_count
depth
evaluation_count
max_nodes
max_experiments
```

Runtime enforcer stops search when any budget trips.

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

