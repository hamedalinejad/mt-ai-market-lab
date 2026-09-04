---
id: DOC-EXPL-014
title: Cost Bundle
status: reviewed
version: 0.2
phase: 0
domain: 14-experiment-lab
updated: 2026-09-04
---

# Versioned Cost Bundle (BUG-VAL-P0-005)

Independent artifact `cost_bundle_id` / version includes:

```text
spread model
commission
swap
slippage
latency
partial fill assumptions
rejection / requote assumptions
```

Experiments and backtests **pin** cost_bundle_id; results without pin are non-comparable.
