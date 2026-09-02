---
id: DOC-AI-017
title: Drift Detection
status: draft
version: 0.2
phase: 0
domain: 10-ai-core
created: 2026-09-02
updated: 2026-09-02
depends_on: [DOC-AI-012, DOC-PRED-003]
related: [DOC-RISK-013]
---

# Drift Detection

## Types

- **Data / feature drift**
- **Concept drift** (relationship feature→outcome changes)
- **Calibration drift**

## Actions

Degrade confidence, disable model (AI health gate), trigger shadow retrain candidate — not blind full overwrite of active model.
