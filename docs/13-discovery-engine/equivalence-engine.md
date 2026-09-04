---
id: DOC-DISC-026
title: Equivalence Engine
status: reviewed
version: 0.2
phase: 0
domain: 13-discovery-engine
updated: 2026-09-04
---

# Equivalence Engine (BUG-DISC-P0-005)

Example: `abs(x)` vs `sqrt(x*x)` may share an equivalence class under policy.

## Layers
```text
syntactic canonicalization
algebraic normalization
numeric equivalence
tolerance (versioned)
```

Equivalent forms collapse to one `equivalence_class` for novelty and multiplicity accounting.
