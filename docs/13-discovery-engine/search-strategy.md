---
id: DOC-DISC-017
title: Search Strategy
status: reviewed
version: 0.4
phase: 0
domain: 13-discovery-engine
---

# Search Budget (binding per run)

```text
max_runtime
max_memory
max_candidates
max_depth
max_nodes
max_experiments
```

Live discovery: stricter subset. Research: higher but still capped.

## Cache
Evaluated expression hashes skipped on re-run unless space/data pins change.

## Algebraic equivalence
Normalize AST (e.g. `A/B` ≡ `A * inv(B)` under registered rules) → single discovery id family.
