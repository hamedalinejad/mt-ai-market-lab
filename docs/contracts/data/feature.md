---
id: DOC-CONTRACT-DATA-feature
title: Feature Registry Contract
status: approved
version: 1.0
phase: 0
domain: contracts
created: 2026-09-04
updated: 2026-09-04
depends_on: ['DOC-CONTRACT-DATA-time']
---

# Feature Registry

Every feature must have:

```text
feature_id, name, definition, unit, timeframe, lookback,
availability semantics, null policy, warmup policy,
source dependencies, implementation version
```

## No implicit semantics
Names alone insufficient. e.g. `return_10` requires explicit: source price, lookback, missing behavior, whether current bar closed, normalization, decision-point eligibility.
