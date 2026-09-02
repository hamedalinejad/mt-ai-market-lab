---
id: DOC-DISC-013
title: Novelty Detection
status: reviewed
version: 0.4
phase: 0
domain: 13-discovery-engine
---

# Novelty Score (components)

```text
syntax_distance          # vs library ASTs
algebraic_distance       # after normalization
correlation_redundancy   # vs existing feature library
behavioral_difference    # outcome/profile distance on eval windows
```

Combined via versioned policy → `novelty_score`. Non-novel duplicates merge/reject.
