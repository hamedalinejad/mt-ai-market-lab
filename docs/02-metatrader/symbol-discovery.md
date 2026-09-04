---
id: DOC-MT5-014
title: Symbol Discovery
status: draft
version: 0.2
phase: 0
domain: 02-metatrader
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-MT5-009]
related: [DOC-MT5-015, DOC-DATA-015]
---

# Symbol Discovery

## Purpose

Build a **dynamic symbol universe** from MT5 and configuration.

## API Surface (reference)

`symbols_get()` (and related) can list instruments and filter by group.

## Universe Layers

```text
Configured Symbols     # operator allowlist / config
Available Symbols      # currently visible from terminal/broker
Discovered Symbols     # newly seen via discovery scan
Disabled Symbols       # explicitly off
```

## Rules

- Selection for sync/live is Configured ∩ Available (unless operator forces otherwise).
- Discovered symbols do not auto-enable pipelines without configuration.
- Instrument metadata snapshot on enable.

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

