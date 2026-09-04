---
id: DOC-SYNC-MERGED-001
title: synchronization
status: reviewed
phase: 0
---
> **Note:** Domain narrative consolidated from multiple former files. Binding contracts remain under `docs/contracts/`. Sections marked TBD are not Phase-0 binding.


# synchronization


<!-- merged from docs/05-synchronization/sync-architecture.md -->

# Sync Architecture

## Purpose

Describe the control plane that keeps local canonical data aligned with sources across restarts and failures.

## Startup Sequence (normative)

```text
LOAD CONFIG
  → CONNECT MT5 (if live mode)
  → DISCOVER / LOAD selected instruments
  → LOAD sync_state
  → COMPARE local vs source (recent window + checkpoints)
  → DETECT gaps
  → CLASSIFY gaps
  → BACKFILL required ranges
  → RECONCILE (including OHLC conflicts)
  → VALIDATE
  → DEDUPLICATE
  → UPDATE sync_state
  → START live collector
```

## Components

| Component | Role |
|-----------|------|
| Sync Planner | Decides ranges to fetch from sync_state + gaps |
| Historical Retriever | Source API batches |
| Live Collector | Incremental follow |
| Normalizer | Broker-time → UTC + identity |
| Quality Gate | Invariants |
| Canonical Writer | Atomic publish |
| Gap Detector / Classifier | Continuity |
| Reconciler | Compare/repair/verify |
| State Store | SQLite sync_state + sync_run |

## Idempotency

Re-running sync for an overlapping range must not duplicate canonical identities. Publish path dedupes on `(instrument_id, timeframe, utc_timestamp)`.

## Timeframe Policy Interaction

- Prioritize **M1** (and selective TICK) sync_state health.
- Higher TF: derive or source-native per timeframe policy; each has its own state row if stored.

## Rules

- Partial failure is recovery-safe: cursors only advance on verified persist.
- Expected gaps do not force error status if classified and accepted.
- Broker-time policy version is stored on sync_state / sync_run.

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


<!-- merged from docs/05-synchronization/restart-recovery.md -->

# Restart Recovery

```text
load sync states
discover source availability
detect gaps
repair
reconcile
resume live
```

Part of Startup sequence; fail closed on integrity errors.

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


<!-- merged from docs/05-synchronization/incremental-sync.md -->

# incremental sync

## Purpose

Specification for **incremental sync** within the 05-synchronization domain.

## Scope

Phase 0 — Documentation First. This is a Specification document, not implementation.

## Definitions

TBD

## Requirements

TBD — to be refined from Master Blueprint.

## Architecture

TBD

## Inputs

TBD

## Outputs

TBD

## Rules

TBD

## Dependencies

TBD

## Failure Modes

TBD

## Validation

TBD

## Acceptance Criteria

TBD

## Risks

TBD

## Open Questions

TBD

## Related Documents

- Master Blueprint (root reference)
- Domain README


<!-- merged from docs/05-synchronization/sync-validation.md -->

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


<!-- merged from docs/05-synchronization/historical-backfill.md -->

# historical backfill

## Purpose

Specification for **historical backfill** within the 05-synchronization domain.

## Scope

Phase 0 — Documentation First. This is a Specification document, not implementation.

## Definitions

TBD

## Requirements

TBD — to be refined from Master Blueprint.

## Architecture

TBD

## Inputs

TBD

## Outputs

TBD

## Rules

TBD

## Dependencies

TBD

## Failure Modes

TBD

## Validation

TBD

## Acceptance Criteria

TBD

## Risks

TBD

## Open Questions

TBD

## Related Documents

- Master Blueprint (root reference)
- Domain README


<!-- merged from docs/05-synchronization/reconciliation.md -->

# Reconciliation

Not row-count alone. Compare:

```text
timestamp set
OHLC
spread
volume
metadata
source provenance
```

Same timestamp + different OHLC ⇒ ohlc_conflict → quarantine → repair → verify.

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


<!-- merged from docs/05-synchronization/gap-detection.md -->

# Gap Detection

## Purpose

Find holes or continuity breaks in local canonical series.

## Bar Series Algorithm (logical)

1. Load coverage for `(instrument_id, timeframe)` from catalog/sync_state.
2. Build expected open timestamps on the TF grid between `first_available` and `last_persisted` using session calendar.
3. Diff expected vs present `utc_timestamp` set.
4. Merge contiguous missing opens into gap intervals.
5. Pass intervals to **Gap Classification**.

## Tick Series

Continuity rules differ (max idle duration while session open). Thresholds are configurable and versioned.

## Triggers

- End of each sync batch
- Startup reconciliation
- Periodic health scan (low priority workload)

## Rules

- Detection without calendar is incomplete (will false-positive weekends).
- Results written as Gap entities; counts rolled into `sync_state.gap_count` (unexpected vs total may be separate metrics).

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


<!-- merged from docs/05-synchronization/duplicate-prevention.md -->

# Duplicate Prevention

## Purpose

Prevent double-insert corruption of datasets.

## Composite Key (bars)

Minimum identity for dedupe:

```text
source
broker
symbol / instrument_id
timeframe
timestamp (utc_timestamp)
```

**Not** timestamp alone.

## Ticks

```text
source + broker + instrument_id + utc_timestamp (+ sequence / tick_id when available)
```

## Live Collector

Effectively-once publish:

- If the same key arrives twice → dedupe; no second canonical row.
- Prefer upsert / ignore-duplicate on publish path.

## Rules

- Double insert must not inflate volume or create conflicting OHLC for the same key.
- Conflicts (same key, different OHLC) escalate to reconciliation/quarantine.

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


<!-- merged from docs/05-synchronization/initial-sync.md -->

# initial sync

## Purpose

Specification for **initial sync** within the 05-synchronization domain.

## Scope

Phase 0 — Documentation First. This is a Specification document, not implementation.

## Definitions

TBD

## Requirements

TBD — to be refined from Master Blueprint.

## Architecture

TBD

## Inputs

TBD

## Outputs

TBD

## Rules

TBD

## Dependencies

TBD

## Failure Modes

TBD

## Validation

TBD

## Acceptance Criteria

TBD

## Risks

TBD

## Open Questions

TBD

## Related Documents

- Master Blueprint (root reference)
- Domain README


<!-- merged from docs/05-synchronization/reconnect-recovery.md -->

# reconnect recovery

## Purpose

Specification for **reconnect recovery** within the 05-synchronization domain.

## Scope

Phase 0 — Documentation First. This is a Specification document, not implementation.

## Definitions

TBD

## Requirements

TBD — to be refined from Master Blueprint.

## Architecture

TBD

## Inputs

TBD

## Outputs

TBD

## Rules

TBD

## Dependencies

TBD

## Failure Modes

TBD

## Validation

TBD

## Acceptance Criteria

TBD

## Risks

TBD

## Open Questions

TBD

## Related Documents

- Master Blueprint (root reference)
- Domain README


<!-- merged from docs/05-synchronization/conflict-resolution.md -->

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

