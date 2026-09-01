---
id: ADR-0004
title: Storage Selection by Benchmark
status: draft
version: 0.1
phase: 0
domain: decisions
created: 2026-09-01
updated: 2026-09-01
depends_on: []
related: []
---

# ADR-0004: Storage Selection by Benchmark

## Context

Phase 0 of mt-ai-market-lab requires clear architectural decisions before any production code is written.

## Problem

We need a formal, reversible decision regarding: **Storage Selection by Benchmark**.

## Options

1. Adopt the principle / approach described in the Master Blueprint.
2. Defer the decision.
3. Choose an alternative approach.

## Decision

Adopt the principle / approach as defined in the Master Blueprint for Phase 0.

## Rationale

- Aligns with Documentation First and Validation Before Promotion.
- Keeps the system reversible and auditable.
- Prevents premature technology lock-in where applicable.

## Trade-offs

- Slightly slower initial progress in exchange for higher long-term safety and clarity.
- Requires discipline in documentation and ADR maintenance.

## Consequences

- All subsequent work must respect this decision.
- Changes require a new or superseding ADR.

## Status

draft
