---
id: DOC-VAL-025
title: Embargo and Purging Contract
status: reviewed
version: 0.4
phase: 0
domain: 15-validation
updated: 2026-09-04
---

# Purging / Embargo Contract (BUG-VAL-P0-002)

Not “use embargo” narrative only. Binding fields:

```text
overlap_interval
label_horizon
purge_rule
embargo_rule
split_generator
```

Machine-readable in experiment/validation config; enforced by ValidationEngine and split generators.
