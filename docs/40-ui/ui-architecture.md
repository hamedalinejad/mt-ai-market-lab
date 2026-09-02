---
id: DOC-UI-001
title: UI Architecture
status: draft
version: 0.2
phase: 0
domain: 40-ui
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-PROD-001]
related: [DOC-OBS-003]
---

# UI Architecture

## Scope candidates

Chart views, Signal, Prediction, Discovery, Model Health, Data Health.

## Separation

```text
MT5 Chart = broker-side visualization
Application UI = intelligence visualization
```

These are different concepts. Core Engine must not depend on Application UI.
