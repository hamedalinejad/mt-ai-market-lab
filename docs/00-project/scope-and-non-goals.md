---
id: DOC-PROJ-033
title: Scope and Non-Goals
status: reviewed
version: 0.2
phase: 0
domain: 00-project
---

# Scope / Non-Goals (R-002)

## Phase 0
Documentation, contracts, validation governance — **no production trading code**.

## Early implementation (vertical slice)
MT5 → data → sync → quality → replay → baseline feature/model → validation → paper path.

## Non-goals (v1)
- Guaranteed profitability or “always discover truth”  
- Unbounded autonomous live trading without Risk/Safe Mode  
- Distributed multi-machine training as day-one requirement

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

