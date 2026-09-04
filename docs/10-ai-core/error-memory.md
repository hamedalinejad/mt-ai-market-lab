---
id: DOC-AI-ERROR-MEM
title: Error Memory and Self-Correction
status: approved
version: 1.0
phase: 0
domain: 10-ai-core
created: 2026-09-04
updated: 2026-09-04
depends_on: ['DOC-PROJ-052']
---

# Error Memory

Minimum record:
```text
error_id, model_version, prediction_id, context_snapshot, feature_snapshot_ref,
prediction, actual_outcome, error_class, regime, market_state,
confidence_at_prediction, posthoc_diagnosis, response_taken, created_at, status
```

May influence: reduced confidence, veto known-bad context, specialist routing, validation priority.

Must track **false vetoes** so self-correction does not become systematic avoidance.
