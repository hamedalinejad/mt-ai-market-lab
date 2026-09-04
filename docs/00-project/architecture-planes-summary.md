---
id: DOC-PROJ-022
title: Pre-Code Architecture Summary
status: reviewed
version: 0.2
phase: 0
domain: 00-project
---

# Planes

| Plane | Tech / Owner |
|-------|----------------|
| Control | SQLite — registry, state, config, sync, experiments, signals, execution audit |
| Data | Parquet — raw, canonical, derived, features, training sets |
| Analytics | DuckDB — research/validation queries |
| Broker | MT5 Adapter only |
| Chart UI | MQL5 Controller |
| Intelligence | Predictor \| Learner \| Discoverer (separate) |

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

