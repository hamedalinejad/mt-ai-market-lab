---
id: DOC-VAL-026
title: Decision Point Propagation
status: reviewed
version: 0.2
phase: 0
domain: 15-validation
updated: 2026-09-04
---

# Decision Point — mandatory on decision-relevant artifacts (BUG-VAL-P0-001)

`decision_point ∈ {bar_open, bar_close, tick, …}` must propagate on:

```text
feature / feature_snapshot
label
prediction
signal
backtest / replay run config
experiment pins (when decision-relevant)
```

Missing decision_point on promotable path ⇒ validation hard-fail.
