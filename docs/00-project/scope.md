---
id: DOC-PROJ-009
title: Scope
status: draft
version: 0.1
phase: 0
domain: 00-project
created: 2026-09-01
updated: 2026-09-01
depends_on: []
related: []
---

# Scope

## Purpose

Specification for **Scope** within the 00-project domain.

## Scope

Phase 0 — Documentation First. This is a Specification document, not implementation.

## Definitions

TBD

## Requirements

TBD — to be refined from Master Blueprint.

## Architecture

TBD

## Inputs

TBD

## Outputs

TBD

## Rules

TBD

## Dependencies

TBD

## Failure Modes

TBD

## Validation

TBD

## Acceptance Criteria

TBD

## Risks

TBD

## Open Questions

TBD

## Related Documents

- Master Blueprint (root reference)
- Domain README


<!-- merged from docs/00-project/non-goals.md -->

# Non Goals

## Purpose

Specification for **Non Goals** within the 00-project domain.

## Scope

Phase 0 — Documentation First. This is a Specification document, not implementation.

## Definitions

TBD

## Requirements

TBD — to be refined from Master Blueprint.

## Architecture

TBD

## Inputs

TBD

## Outputs

TBD

## Rules

TBD

## Dependencies

TBD

## Failure Modes

TBD

## Validation

TBD

## Acceptance Criteria

TBD

## Risks

TBD

## Open Questions

TBD

## Related Documents

- Master Blueprint (root reference)
- Domain README


<!-- merged from docs/00-project/scope-and-non-goals.md -->

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


<!-- merged from docs/00-project/product-boundary.md -->

# Product Boundary

| Component | Core? |
|-----------|-------|
| Core Engine | **Yes** |
| MT5 Connector / Adapter | **Yes** |
| CLI | Yes (operator) |
| Research Tools | Yes (offline path) |
| Desktop UI | Optional / later |
| Notification adapters | Optional channels |

Core remains usable headless (CLI + engine).

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

