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
