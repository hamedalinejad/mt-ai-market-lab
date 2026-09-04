---
id: DOC-STRAT-README
title: Strategy Engine
status: approved
version: 1.0
phase: 0
domain: 17-strategy-engine
created: 2026-09-04
updated: 2026-09-04
depends_on: ['DOC-PROJ-052', 'DOC-SIG-README']
---

# Strategy Engine

A strategy is a **versioned policy** composed from validated pieces.

## Minimum definition
```text
strategy_id, version, scope / instrument filters,
entry rule, exit rule, stop logic, take-profit logic,
sizing policy, validity conditions, invalidation conditions,
risk profile, cost assumptions, promotion state
```

A strategy **cannot** become active because a single signal was successful.
