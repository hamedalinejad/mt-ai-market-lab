---
id: ADR-0014
title: Chart Open via MQL5 Bridge
status: draft
version: 0.1
phase: 0
domain: decisions
created: 2026-09-01
updated: 2026-09-01
depends_on: [DOC-MT5-005, ADR-0008]
related: [DOC-MT5-015]
---

# ADR-0014: Chart Open via MQL5 Bridge

## Context

Operators may require GUI charts for selected symbols. Python `symbol_select` only affects Market Watch, not `ChartOpen`.

## Problem

How should the lab open terminal charts?

## Options

1. **Option A:** Python controller commands an MQL5 EA/Script to call `ChartOpen`
2. **Option B:** No GUI charts; Market Watch + lab visualization only
3. Ignore charts entirely in all phases

## Decision

When chart-open remains a requirement, use **Option A** (MQL5 bridge). Chart failures must not block data pipelines. If product scope drops GUI charts, Option B applies without further ADR.

## Rationale

- Matches MT5 platform capabilities honestly
- Keeps Python focused on data/control plane
- Isolates GUI from trading correctness

## Consequences

- Integration boundary includes a chart-command channel
- EA must be versioned and audited like any bridge component
- No Signal/Execution dependency on chart state
