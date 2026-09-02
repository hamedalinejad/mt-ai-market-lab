---
id: DOC-DISC-023
title: Discovery Multiple Testing Accounting
status: reviewed
version: 0.2
phase: 0
domain: 13-discovery-engine
related: [DOC-VAL-014]
---

# Multiple Testing (per search family)

Every search run records:

```text
multiplicity_family_id
hypothesis_count
effective_search_count
```

Promotion path consumes these in Validation multiple-testing control. Missing metadata ⇒ non-promotable.
