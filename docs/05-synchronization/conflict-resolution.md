---
id: DOC-SYNC-002
title: Conflict Resolution
status: draft
version: 0.2
phase: 0
domain: 05-synchronization
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-SYNC-009]
related: [DOC-SYNC-007, DOC-DATA-013]
---

# Conflict Resolution

## Purpose

Define how reconciliation conflicts are resolved without silent data corruption.

## Policies (default)

| Conflict | Default resolution |
|----------|-------------------|
| missing_local + market open | Backfill from source → canonical append |
| missing_local + expected closure | Classify gap; no fill |
| ohlc_conflict | Quarantine local; re-fetch source; replace with audit record; verify |
| duplicate_local | Keep one row by deterministic tie-break; archive duplicate evidence |
| missing_source | Do not delete local automatically; flag for investigation |

## Audit

Every destructive or replacing repair writes:

- sync_run_id
- before/after hashes or OHLC snapshots
- policy version
- operator id if manual

## Rules

- No repair without classification.
- Training datasets must not include quarantined conflict rows unless experiment opts in.
