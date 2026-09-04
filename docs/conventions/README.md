---
id: DOC-CONV-0001
title: Conventions Overview
status: draft
version: 0.1
phase: 0
domain: conventions
created: 2026-09-01
updated: 2026-09-01
depends_on: []
related: []
---

# Conventions

This folder defines documentation standards for the entire project.

- [documentation-guidelines.md](documentation-guidelines.md)
- [naming-conventions.md](naming-conventions.md)
- [frontmatter-standard.md](frontmatter-standard.md)
- [status-model.md](status-model.md)
- [versioning.md](versioning.md)
- [cross-reference-rules.md](cross-reference-rules.md)

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

