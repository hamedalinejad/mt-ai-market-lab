---
id: DOC-OPS-002
title: Shutdown
status: draft
version: 0.2
phase: 0
domain: 28-operations
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-RUN-001]
related: [DOC-OPS-001, DOC-SYNC-013]
---

# Shutdown

## Normative Sequence

```text
stop live ingestion
flush buffers
commit DB
checkpoint
persist sync state
persist model state (shadow/runtime pointers)
persist runtime state
close MT5
```

## Rules

- Dirty shutdown is recovered by Startup Recovery; clean shutdown minimizes recovery work.
- Never leave partial canonical publishes without rolling back or marking incomplete batches.

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

