---
id: DOC-PROJ-051
title: System Identity — Purpose and Non-Goals
status: approved
version: 1.0
phase: 0
domain: 00-project
created: 2026-09-04
updated: 2026-09-04
depends_on: ['DOC-PROJ-050']
related: []
---

# System Identity

## Purpose

Local-first, Windows-compatible **market intelligence laboratory** capable of:

- ingesting market data from MetaTrader 5 and external files (e.g. Parquet);
- preserving **raw evidence** and a **normalized canonical** series;
- continuously repairing gaps from downtime or connectivity loss;
- representing multiple markets and timeframes consistently;
- producing features, predictions and uncertainty estimates;
- discovering patterns, relationships, formulas and candidate strategies;
- testing knowledge under anti-leakage and multiple-testing controls;
- maintaining explicit provenance for data, models, hypotheses, experiments and decisions;
- continuously evaluating whether previous models/knowledge remain valid;
- supporting paper trading and, much later, controlled live execution;
- remaining lightweight enough for a normal consumer laptop.

## Non-goals

- high-frequency trading;
- exchange-colocated infrastructure;
- guaranteed sub-millisecond execution;
- autonomous capital deployment without hard external safety controls;
- opaque end-to-end models that cannot be replayed or traced;
- treating statistical correlation as causal truth;
- treating discovered relationships as valid merely because they performed well in-sample.

## Acceptance Criteria

```text
AC-ID-01
Given a proposed feature that requires HFT colocation assumptions
When scoped against this identity
Then it is out of scope for v1 laboratory design
```
