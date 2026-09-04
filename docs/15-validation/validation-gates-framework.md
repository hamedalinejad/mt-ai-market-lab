---
id: DOC-VAL-030
title: Validation Gates Framework
status: reviewed
version: 0.2
phase: 0
domain: 15-validation
---

# Gates Framework (B-006)

**Do not hard-lock “6 gates” or “7 gates”.**

Use an artifact-specific gate **set** versioned as `gate_set_id`.  
Promotion consumes a named gate_set; search-origin candidates cannot skip multiplicity/leakage gates.
