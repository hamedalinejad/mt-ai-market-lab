---
id: DOC-VAL-REPLAY
title: Replay Specification
status: approved
version: 0.3
phase: 0
---

# Replay Engine (consolidated)

Deterministic replay of market + control events for debug, training, validation, paper.

Requirements: event ordering, clock, deterministic seed, tick/bar replay, latency/slippage simulation, partial fills, checkpoint, pause/resume.

Equality policies: bitwise | tolerance | event | trade sequence | metric — pin per test.

## Acceptance Criteria

```text
AC-REPLAY-01
Given same dataset pins, config, model, seed
When replay runs twice
Then results match the declared equality policy
```
