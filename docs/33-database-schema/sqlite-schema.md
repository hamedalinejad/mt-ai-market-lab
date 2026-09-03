---
id: DOC-DB-001
title: SQLite Logical Schema
status: reviewed
version: 0.7
phase: 0
domain: 33-database-schema
updated: 2026-09-04
---

# SQLite Control-Plane Schema

## Base tables
instrument, sync_state, gap, model_registry, experiment, hypothesis, knowledge_node, signal, order_intent, event_log

## Extended (BUG-P0-006) — must be queryable tables
account, account_snapshot, position, execution_fill, broker_order, order_event,
dataset, dataset_snapshot, dataset_partition, feature_set, label_definition,
prediction, prediction_outcome, model_evaluation, promotion_decision,
discovery_candidate, discovery_evaluation, knowledge_evidence, failure_memory,
runtime_instance, health_snapshot, alert, config_version, policy_version, migration_metadata

Rule: do not bury queryable control artifacts only inside opaque JSON.
