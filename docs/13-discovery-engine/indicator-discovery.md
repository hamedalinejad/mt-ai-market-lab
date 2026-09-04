---
id: DOC-DISC-011
title: Indicator Discovery
status: draft
version: 0.2
phase: 0
domain: 13-discovery-engine
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-DISC-008, DOC-DISC-006]
related: [DOC-FEAT-001, DOC-TKNW-007]
---

# Indicator Discovery

## Purpose

Treat indicators as **named or unnamed formulas over market representations** subject to the same Candidate lifecycle.

## Layers

1. **Known indicators** — catalog definitions (RSI, MACD, …) as baselines and features.
2. **Parameterized variants** — search periods, smoothers, normalizations.
3. **Novel formulas** — from Formula/Symbolic/GP search.

## Rules

- “Indicator” in production Signal path requires Validation + Knowledge status Active.
- Classic names do not grant exemption from leakage / OOS / multiple-testing controls when claiming edge.

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

