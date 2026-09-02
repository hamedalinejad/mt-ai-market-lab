---
id: DOC-RISK-013
title: Risk Gates
status: draft
version: 0.2
phase: 0
domain: 18-risk-engine
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-RISK-001]
related: [DOC-OBS-001, DOC-DATA-007]
---

# Risk Gates

## Data Quality Gate

```text
data_health < threshold  →  NO TRADE
```

## AI Health Gate

```text
model calibration degraded  →  disable model / DENY signals from it
```

## Discovery Health Gate

Thousands of unstable discoveries → **discovery circuit breaker**.

Gates are independent of AI confidence.
