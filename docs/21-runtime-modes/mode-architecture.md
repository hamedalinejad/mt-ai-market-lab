---
id: DOC-RUN-001
title: Mode Architecture
status: reviewed
version: 0.5
phase: 0
domain: 21-runtime-modes
---

# Runtime Modes (minimum)

```text
OFFLINE_RESEARCH
TRAINING
VALIDATION
PAPER
LIVE_ANALYSIS
LIVE_TRADING
SAFE_MODE
```

Each mode defines: allowed components, forbidden components, resource budget, state transitions, exit conditions.
