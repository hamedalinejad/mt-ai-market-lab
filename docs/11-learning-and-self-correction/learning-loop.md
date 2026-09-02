---
id: DOC-LEARN-001
title: Learning Loop
status: draft
version: 0.2
phase: 0
domain: 11-learning-and-self-correction
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-LEARN-015]
related: [DOC-AI-012]
---

# Learning Loop

## Anti-oscillation controls

```text
update threshold
minimum evidence
cooldown
rollback threshold
stability window
```

Blind `error → update → error → update` loops are forbidden.

## Continual learning with replay

```text
Recent Data
+ Representative Historical Data
+ Failure Cases
+ Rare Events
+ Regime Samples
```

Mitigates catastrophic forgetting.

## Failure memory weighting

Failures are not equal:

```text
normal miss | rare-event miss | regime-change miss
execution miss | data-quality miss | model-confidence miss
```
