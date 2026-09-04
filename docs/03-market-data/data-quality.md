---
id: DOC-PATH-03-MARKET-DATA-DATA-QUALITY-MD
title: Data Quality
status: draft
version: 0.2
phase: 0
domain: 03-market-data
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-DATA-001]
related: [DOC-DATA-003, DOC-SYNC-003, DOC-AI-001]
---

# Data Quality

## Purpose

**Quality before AI.** Corrupted data must not reach Analysis, Training, Discovery, or Inference as if it were clean.

## Pipeline (normative)

```text
Raw
 ↓
Schema Validation
 ↓
Timestamp Validation
 ↓
Duplicate Detection
 ↓
Gap Detection
 ↓
OHLC Validation
 ↓
Price Validation
 ↓
Volume Validation
 ↓
Cross-Timeframe Validation
 ↓
Canonical
```

## Rules

- Fail or quarantine at the earliest stage; do not silently “fix” and promote.
- `quality_status` on canonical rows: `ok | suspect | rejected | gap_filled | quarantined`
- AI/Discovery consumers read only rows allowed by policy (default: `ok`, optionally `suspect` for research-only).

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

