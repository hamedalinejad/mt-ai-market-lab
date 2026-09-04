---
id: DOC-MT5-005
title: Chart Management
status: reviewed
version: 0.5
phase: 0
domain: 02-metatrader
updated: 2026-09-04
related: [ADR-0014]
---

# Chart Opening ≠ Data API (BUG-P0-014)

| Capability | Owner |
|------------|--------|
| symbol selection, rates/ticks, orders | **Python MT5 Adapter** |
| ChartOpen / chart lifecycle GUI | **MQL5 Chart Controller** |

```text
Python Controller → command contract → MQL5 Chart Controller → ChartOpen
```

`symbol_select` is **not** “open chart in UI”. Chart failure must not block data sync.

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

