---
id: DOC-DATA-007
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
