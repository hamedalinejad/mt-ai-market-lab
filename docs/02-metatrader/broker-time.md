---
id: DOC-MT5-004
title: Broker Time
status: draft
version: 0.2
phase: 0
domain: 02-metatrader
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-MT5-009]
related: [DOC-DATA-022, DOC-DATA-025, DOC-MT5-012]
---

# Broker Time

## Purpose

Treat **broker/terminal server time** as a first-class input to the data plane (P0).

## Why P0

MT5 history and “bar time” are interpreted in the terminal/broker time context. DST changes, server offset, and daily boundaries affect:

- which UTC instant is the open of D1
- whether a hole is weekend closure or data loss
- alignment between TFs when deriving from M1

## Responsibilities of MT5 Adapter

1. Read server/broker time related fields available from the terminal API.
2. Attach `source_timestamp`, `broker_server_time` (when available), and zone/offset metadata to raw batches.
3. Never silently cast bar open integers to “UTC” without recording the conversion policy version.
4. Surface clock skew health: lab UTC vs last known server time delta.

## Rules

- Sync and gap logic consume **normalized UTC** plus **session calendar**, both versioned.
- Operator documentation must state which broker server timezone assumption is active.

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

