---
id: DOC-DISC-023
title: Discovery Multiple Testing
status: reviewed
version: 0.3
phase: 0
domain: 13-discovery-engine
updated: 2026-09-04
---

# Multiple-Testing Correction (BUG-DISC-P0-004)

Not a name-only field. Each search family records:

```text
search_family / multiplicity_family_id
family_size_estimate
test_count
correction_method
holdout_discipline
archive_policy
effective_search_count
```

Promotion without these metadata ⇒ denied.
