---
id: DOC-VAL-027
title: Nested Validation Pipeline
status: reviewed
version: 0.2
phase: 0
domain: 15-validation
updated: 2026-09-04
---

# Nested Validation — canonical (BUG-VAL-P0-004)

```text
Outer Train
Outer Validation/Test

Inside Train:
  Inner Search/Selection
  Inner Validation

Final:
  Frozen Candidate
  Outer Test
```

Inner selection must not see Outer Test. Search multiplicity accounted on the outer-facing report.
