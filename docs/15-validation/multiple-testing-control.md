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

## Acceptance Criteria

```text
AC-01
Given this document is binding for its domain
When an implementer builds against it
Then behavior must satisfy the stated invariants and contracts herein
And violations fail validation or static gates before promotion
```

```text
AC-02
Given status is not approved
When production code for this scope is proposed
Then it must be rejected until status reaches approved
```

