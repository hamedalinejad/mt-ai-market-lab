---
id: DOC-SYNC-014
title: Sync Validation
status: draft
version: 0.2
phase: 0
domain: 05-synchronization
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-SYNC-009, DOC-DATA-003]
related: [DOC-SYNC-013]
---

# Sync Validation

## Purpose

Checks that must pass before treating a range as healthy.

## Checks

1. Identity uniqueness
2. OHLC invariants
3. Timestamp monotonicity within partition
4. No open **unexpected** gaps in claimed continuous range
5. Reconciliation sample clean (no unresolved ohlc_conflict)
6. sync_state cursors ≤ max persisted ts

## Failure

On failure: status → error or remain backfilling; do not claim live-healthy.

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

