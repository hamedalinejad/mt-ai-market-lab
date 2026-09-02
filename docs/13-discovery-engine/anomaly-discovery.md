---
id: DOC-DISC-002
title: Anomaly Discovery
status: draft
version: 0.2
phase: 0
domain: 13-discovery-engine
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-DATA-007]
related: [DOC-RISK-001, DOC-OBS-001]
---

# Anomaly Detection

## Before Signal

Bad ticks / price spikes must block or gate Signal generation.

## Two classes

| Class | Example |
|-------|---------|
| **Data anomaly** | EURUSD jumps 1000 pips from corrupted tick |
| **Market anomaly** | EURUSD moves 100 pips on real news |

Data anomalies → quarantine / quality gate. Market anomalies → context for models/risk, not automatic discard of market truth.
