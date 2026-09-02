---
id: DOC-RUN-002
title: Live Analysis Mode
status: draft
version: 0.2
phase: 0
domain: 21-runtime-modes
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-RUN-001]
related: [DOC-MT5-011, DOC-AI-012]
---

# Live Analysis Mode

## Process

Runs in the **LIVE PROCESS**:

```text
MT5 → Data Collector → Feature Engine → Inference → Signal (+ light shadow learning)
```

## Includes

- MT5 connection, sync, live data
- Analysis, prediction, signal
- Light online learning **only** via shadow + governance
- Monitoring

## Excludes

- Heavy training
- Full Discovery search
- Adversarial campaigns that starve live resources
