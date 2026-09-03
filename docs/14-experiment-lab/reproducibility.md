---
id: DOC-EXPL-011
title: Reproducibility
status: reviewed
version: 0.4
phase: 0
domain: 14-experiment-lab
---

# Reproducibility

Same pins must replay the experiment:

```text
dataset_snapshot_id + code_version + config_version + seed
(+ feature_set_id / model_id when applicable)
```

Missing pins ⇒ non-comparable / non-promotable.
