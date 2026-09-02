---
id: DOC-CONTRACT-REPLAY-001
title: Replay Engine Specification
status: draft
version: 0.2
phase: 0
domain: contracts
---

# Replay Engine Specification

## Capabilities

```text
event ordering
clock (simulated)
deterministic seed
tick replay
bar replay
order simulator
latency model
spread model
slippage model
partial fills
checkpoint
pause / resume
deterministic reproducibility
```

## Determinism

```text
same dataset_snapshot + config_version + model_version + seed → same results
```

## Ordering

Single global event queue by availability time; higher-TF bars only close when clock reaches close.

## Checkpoint

Persist clock, positions, intent states, RNG state for resume.
