---
id: DOC-MT5-012
title: Market Sessions
status: draft
version: 0.2
phase: 0
domain: 02-metatrader
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-MT5-004, DOC-DATA-025]
related: [DOC-DATA-013, DOC-DATA-018]
---

# Market Sessions

## Purpose

Model trading sessions and closures used for gap classification and session features.

## Concepts

- **Session segment** — continuous trading window (e.g. exchange session).
- **Market closed** — expected non-trading interval (weekend, holiday, daily break).
- **Session calendar** — versioned schedule per instrument or asset class.

## Use in Gap Logic

If no bar is expected because the market is closed under the active calendar, gap class is **expected_market_closure** (or holiday/session_break), not `source_missing`.

## Rules

- Crypto 24/7 calendars differ from FX; asset class selects default calendar family.
- Calendar version is part of dataset lineage.

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

