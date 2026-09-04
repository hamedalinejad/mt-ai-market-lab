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

