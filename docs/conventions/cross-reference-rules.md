---
id: DOC-CONV-0002
title: Cross-Reference Rules
status: draft
version: 0.1
phase: 0
domain: conventions
created: 2026-09-01
updated: 2026-09-01
depends_on: []
related: []
---

# Cross-Reference Rules

- Prefer relative links within the repository.
- Update `depends_on` and `related` in frontmatter when linking.
- Keep REGISTRY.md in sync with major documents.

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

