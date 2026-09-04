---
id: DOC-DISC-004
title: Discovery Memory
status: draft
version: 0.2
phase: 0
domain: 13-discovery-engine
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-DISC-008]
related: [DOC-KNOW-001, DOC-LEARN-008]
---

# Discovery Memory

## Purpose

Retain accepted and rejected discoveries with full expression metadata for novelty checks and negative evidence.

## Stores

Explainable formula/pattern payloads (expression, operators, inputs, scores, failure modes).

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

