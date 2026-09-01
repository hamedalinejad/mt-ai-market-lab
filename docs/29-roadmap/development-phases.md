---
id: DOC-ROAD-004
title: development phases
status: draft
version: 0.2
phase: 0
domain: 29-roadmap
created: 2026-09-01
updated: 2026-09-01
depends_on: []
related: [DOC-MASTER-001]
---

# Development Phases

## Two views of the roadmap

The project uses **two aligned views**:

### A) High-level roadmap (Master Blueprint §51) — 10 stages (0–9)

```text
PHASE 0  Documentation
PHASE 1  Foundation + Data + MT5 Sync
PHASE 2  Market Representation + Features
PHASE 3  Analysis + AI Core + Learning
PHASE 4  Discovery + Experiment Lab
PHASE 5  Validation + Knowledge Base
PHASE 6  Prediction + Signal + Strategy
PHASE 7  Risk + Paper Trading
PHASE 8  Controlled Live
PHASE 9  Continuous Discovery + Continuous Improvement
```

### B) Detailed roadmap (domain specs) — 12 stages (0–11)

These files exist under `docs/29-roadmap/` for finer planning and DoD tracking:

| Detailed | Maps into high-level |
|----------|----------------------|
| phase-0-documentation | PHASE 0 |
| phase-1-foundation | PHASE 1 |
| phase-2-data | PHASE 1 |
| phase-3-metatrader-sync | PHASE 1 |
| phase-4-analysis | PHASE 2–3 |
| phase-5-ai-learning | PHASE 3 |
| phase-6-discovery | PHASE 4 |
| phase-7-prediction-signals | PHASE 6 |
| phase-8-validation-paper-trading | PHASE 5 + PHASE 7 |
| phase-9-risk | PHASE 7 |
| phase-10-live-execution | PHASE 8 |
| phase-11-continuous-improvement | PHASE 9 |

**Rule:** When communicating externally or in ADRs, prefer the high-level PHASE 0–9 numbering. Detailed phase files are for implementation planning and acceptance checklists.

## Purpose

Define sequencing, dependencies, and Definition of Done per phase without locking technology choices before Benchmark + ADR.

## Scope

Phase 0 — Documentation First. No production code required to complete Phase 0 structure; full Specification content is progressive within Phase 0.

## Requirements

- Every phase has explicit entry/exit criteria.
- No phase enables Live Trading without Safety Gates from PHASE 7–8.
- Discovery remains Candidate-only until Validation Gates pass.

## Open Questions

- Exact duration of each phase (deferred).
- First Symbol / Timeframe set for Phase 1 (deferred to Benchmark).
