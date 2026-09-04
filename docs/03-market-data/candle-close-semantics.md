---
id: DOC-DATA-004
title: Candle Close Semantics
status: reviewed
version: 0.5
phase: 0
domain: 03-market-data
updated: 2026-09-04
---

# Candle Close Semantics — locked (BUG-P0-016)

Must be defined centrally (not re-interpreted per model/feature):

```text
candle open time
candle close boundary
inclusive/exclusive endpoint policy
timezone
DST handling
broker session
incomplete current candle rules
revised closed candle rules
```

| Decision point | Rule |
|----------------|------|
| bar_open | current bar OHLC not usable |
| bar_close | values only after close |
| tick | state up to that tick only |

Feature/model code **must not** invent private close semantics.

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

