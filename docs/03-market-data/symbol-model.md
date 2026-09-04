---
id: DOC-DATA-021
title: Symbol Model
status: draft
version: 0.2
phase: 0
domain: 03-market-data
created: 2026-09-01
updated: 2026-09-01
depends_on: [DOC-DATA-015]
related: [DOC-MT5-014, DOC-MT5-015]
---

# Symbol Model

## Purpose

Clarify **Symbol** (broker-facing name) vs **Instrument** (internal entity).

## Definitions

| Term | Meaning |
|------|---------|
| Symbol | String identifier in a broker/terminal context (`EURUSD`) |
| Instrument | Internal lab entity with stable `instrument_id` and full metadata |

One Instrument ↔ one primary Symbol per broker binding; aliases may exist.

## Binding

```text
(broker, server?, name) → instrument_id
```

## Selection

Symbols enter the lab only through **symbol selection** configuration + discovery (Market Watch / available list). Selecting a symbol:

1. Resolves or creates Instrument metadata snapshot
2. Enables sync for configured timeframes (per timeframe policy)
3. Does **not** by itself open a GUI chart (see Chart Management)

## Rules

- Never key long-term storage partitions only by mutable display name without catalog mapping to `instrument_id`.
- `canonical_name` is for analytics joins; storage paths may use broker `name` for operator clarity if catalog maps correctly.

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

