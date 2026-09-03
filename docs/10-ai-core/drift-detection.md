---
id: DOC-AI-017
title: Drift Detection
status: reviewed
version: 0.5
phase: 0
domain: 10-ai-core
updated: 2026-09-04
---

# Drift Taxonomy + Threshold Contract (BUG-AI-P0-010)

| Type | Notes |
|------|--------|
| feature drift | input feature distribution |
| label drift | label distribution |
| prediction drift | output distribution |
| residual drift | error residual distribution |
| concept drift | P(y\|x) change |

Each type requires versioned:
```text
metric
reference_window
current_window
threshold
action              # alert | degrade | shadow-retrain | rollback | …
```
