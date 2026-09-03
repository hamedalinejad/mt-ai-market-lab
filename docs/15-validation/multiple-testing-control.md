---
id: DOC-VAL-014
title: Multiple Testing Control
status: reviewed
version: 0.4
phase: 0
domain: 15-validation
---

# Multiple Testing

After every Discovery search run, persist:

```text
number_of_hypotheses
families (multiplicity_family_id)
selection_bias context
effective_trials / effective_search_count
```

Consumed at Promotion Gate. Missing ⇒ reject promotion.
