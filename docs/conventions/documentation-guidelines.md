---
id: DOC-CONV-0003
title: Documentation Guidelines
status: draft
version: 0.1
phase: 0
domain: conventions
created: 2026-09-01
updated: 2026-09-01
depends_on: []
related: []
---

# Documentation Guidelines

## Principles

1. Documentation First — no production code before approved Specification.
2. Every document has YAML frontmatter.
3. Use the standard template sections.
4. Keep Candidates distinct from Truth.
5. Record decisions as ADRs.

## Standard Template Sections

- Purpose
- Scope
- Definitions
- Requirements
- Architecture
- Inputs
- Outputs
- Rules
- Dependencies
- Failure Modes
- Validation
- Acceptance Criteria
- Risks
- Open Questions
- Related Documents

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

