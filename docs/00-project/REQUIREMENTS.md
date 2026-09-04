---
id: DOC-PROJ-031
title: Requirements System
status: reviewed
version: 0.2
phase: 0
domain: 00-project
updated: 2026-09-04
---

# Requirements (R-001)

Each requirement must have:

```text
requirement_id
source
owner
status
acceptance_criteria
downstream_specs[]
```

Catalog index: [requirements-catalog.md](requirements-catalog.md)  
Traceability: [TRACEABILITY.md](TRACEABILITY.md)

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

