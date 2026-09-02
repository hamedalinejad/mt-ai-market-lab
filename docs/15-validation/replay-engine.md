---
id: DOC-VAL-017
title: Replay Engine
status: draft
version: 0.2
phase: 0
domain: 15-validation
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-VAL-004]
related: [DOC-EXPL-011, DOC-OPS-001]
---

# Replay Engine

## Capability

```text
Replay from timestamp T
```

Reconstruct Live-like behavior on historical data for debug, training evaluation, validation, paper.

## Deterministic Replay

```text
same dataset + config + model + seed  →  same result
```

Required for audit and experiment comparability.
