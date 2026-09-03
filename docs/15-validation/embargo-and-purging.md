---
id: DOC-VAL-025
title: Embargo and Purging
status: reviewed
version: 0.3
phase: 0
domain: 15-validation
---

# Embargo / Purge (machine-readable)

For overlapping labels, split config must include:

```text
purge_window
embargo_window
horizon_aware_split: true
overlap_group          # from label contract
```

Serializable in experiment/validation config; enforced by ValidationEngine.
