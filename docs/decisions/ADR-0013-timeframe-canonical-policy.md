---
id: ADR-0013
title: Canonical Timeframe and Derivation Policy
status: accepted
version: 0.1
phase: 0
domain: decisions
created: 2026-09-01
updated: 2026-09-01
depends_on: [DOC-DATA-023, DOC-STOR-009]
related: [ADR-0004, DOC-MT5-008]
---

# ADR-0013: Canonical Timeframe and Derivation Policy

## Context

Multi-year storage of all broker timeframes independently is expensive and can create inconsistent series across TFs.

## Problem

Which timeframes are stored from MT5, and which are derived?

## Options

1. Store every TF independently from MT5 always.
2. Store only ticks; derive all bars.
3. Store **M1** (and selective ticks) as canonical base; derive higher TFs; allow **source-native** higher TF exceptions for depth/session/config.

## Decision

Adopt **option 3** as Phase 0 policy direction:

- Canonical base bars: **M1** (default)
- Ticks: selective
- Higher TFs: derive by default; materialization optional
- Exceptions for source-native bars when broker history/session or explicit config requires it

## Rationale

- Reduces redundancy and clarifies lineage
- Matches laptop resource goals
- Preserves escape hatch when MT5 history depth differs by TF

## Consequences

- Sync prioritizes M1 coverage
- Derived series carry definition version + `derived_from`
- Benchmarks must measure derivation cost vs storage cost
