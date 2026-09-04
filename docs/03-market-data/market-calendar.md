---
id: DOC-DATA-018
title: Market Calendar
status: draft
version: 0.2
phase: 0
domain: 03-market-data
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-DATA-025]
related: [DOC-DATA-013, DOC-MT5-012]
---

# Market Calendar

## Purpose

Versioned calendars of sessions, weekends, and holidays used for gap classification and session features.

## Contents

- Weekly closed intervals (e.g. FX weekend)
- Holiday lists (exchange/broker relevant)
- Optional intraday session segments
- Valid-from / valid-to for rule changes

## Rules

- Gap detection **requires** a calendar reference.
- Calendar id + version appear in sync_run and dataset manifests.

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

