---
id: DOC-DATA-024
title: Tick Model
status: draft
version: 0.2
phase: 0
domain: 03-market-data
created: 2026-09-01
updated: 2026-09-01
depends_on: [DOC-DATA-001]
related: [DOC-STOR-009, DOC-MT5-016]
---

# Tick Model

## Purpose

Canonical tick contract for live and historical tick streams.

## Identity

```text
(instrument_id, timestamp_utc, sequence?)
```

If broker does not provide unique sequence, ingestion assigns monotonic `ingestion_seq` per instrument within a run.

## Fields

| Field | Required | Description |
|-------|----------|-------------|
| timestamp_utc | yes | Event time UTC |
| instrument_id | yes | |
| bid | yes | |
| ask | yes | |
| last | no | |
| volume | no | |
| flags | no | Source-specific packed flags |
| source | yes | |
| source_timestamp | no | Original clock if available |
| ingestion_timestamp | yes | Receive time |
| quality_status | yes | |

## Invariants

1. `ask >= bid` when both present (otherwise mark suspect)
2. Timestamps not in the future beyond configured skew tolerance

## Retention Policy (Candidate)

Ticks are high volume. Candidates:

- Full retention for selected symbols only
- Rolling window + aggregated bars always retained
- On-demand re-download from MT5 when broker allows

Final policy = Benchmark + ADR.

## Rules

- Building bars from ticks must be deterministic given the same tick set and session calendar.
