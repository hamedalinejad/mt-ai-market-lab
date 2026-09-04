---
id: DOC-DISC-016
title: Relationship Discovery
status: draft
version: 0.2
phase: 0
domain: 13-discovery-engine
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-DISC-006]
related: [DOC-ANLY-003, DOC-VAL-013]
---

# Relationship Discovery

## Purpose

Discover cross-series and structural relationships as Candidates.

## Includes

Cross-market and cross-timeframe relationships when enabled.

## Rules

- All cross-symbol features use **causal availability** (no future of B into decision on A).
- Relationship Candidates still go through Validation and multiplicity accounting.

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

