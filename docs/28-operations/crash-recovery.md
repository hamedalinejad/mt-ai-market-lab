---
id: DOC-OPS-009
title: Crash Recovery Checkpoint Contract
status: reviewed
version: 0.2
phase: 0
domain: 28-operations
updated: 2026-09-04
---

# Crash Recovery (BUG-OPS-P0-003)

Important process state must checkpoint:

```text
checkpoint_id
last_committed_event
last_dataset_cursor
model_state_version
runtime_mode
sync_state watermarks
```

Restart loads checkpoints before live resume; never assume in-memory truth.

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

