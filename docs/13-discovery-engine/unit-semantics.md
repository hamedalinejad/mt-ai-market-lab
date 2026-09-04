---
id: DOC-DISC-025
title: Unit / Semantic Types
status: reviewed
version: 0.2
phase: 0
domain: 13-discovery-engine
updated: 2026-09-04
---

# Unit Semantics (BUG-DISC-P0-003)

Expressions are typed. Example **invalid** unless explicit cast policy exists:

```text
price + volatility
```

Semantic types (examples): price, return, volatility, volume, dimensionless, boolean, time_lag.

Type checker runs before evaluation; violations → reject candidate generation.
