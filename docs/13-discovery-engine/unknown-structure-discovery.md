---
id: DOC-DISC-021
title: Unknown Structure Discovery
status: draft
version: 0.2
phase: 0
domain: 13-discovery-engine
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-DISC-014, DOC-REPR-002]
related: [DOC-DISC-013, DOC-VAL-001]
---

# Unknown Structure Discovery

## Purpose

Find structures not in the human candlestick taxonomy.

## Intent

```text
shape + regime + volume + time context → shifted outcome distribution
```

## Method Family (candidates)

- Sequence encoding + clustering
- Motif discovery
- Representation learning (resource-limited)
- Rule mining over representation predicates

## Rules

- Outputs require characterization humans can inspect when possible.
- Statistical claims require full Validation stack including multiple-testing control.
