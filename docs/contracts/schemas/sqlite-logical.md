---
id: DOC-SCHEMA-sqlite-logical
title: SQLite Logical Schema
status: reviewed
version: 0.6
phase: 0
domain: contracts
---

# Relational Logical Schema (control plane)

Tables: instrument, sync_state, gap, model_registry, experiment, hypothesis, knowledge_node, knowledge_evidence, signal, order_intent, event_log, dataset_snapshot_index

PK/FK/uniqueness as in domain sqlite-schema docs. Forward-only migrations.

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

