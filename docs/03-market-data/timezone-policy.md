---
id: DOC-DATA-025
title: Timezone Policy
status: draft
version: 0.2
phase: 0
domain: 03-market-data
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-DATA-022, DOC-MT5-004]
related: [DOC-DATA-018, DOC-MT5-012]
---

# Timezone Policy

## Purpose

Govern how source times become UTC and how session/market dates are assigned.

## Principles

1. **Preserve source evidence** — never overwrite source clocks with only UTC.
2. **One policy version per dataset** — session/DST rules are versioned.
3. **Instrument-scoped** — different symbols/brokers may differ.
4. **Explicit DST handling** — transitions are first-class, not ignored.

## Policy Object (logical)

```text
timezone_policy_id
version
broker_server_timezone      # e.g. fixed offset or named zone used by server
dst_rules_ref               # how DST is applied for this broker/server
session_calendar_ref
daily_bar_boundary_rule     # e.g. server-midnight / exchange session end
notes
```

## Effects on Candles

| Concern | Why policy matters |
|---------|-------------------|
| D1/W1/MN1 open | Boundary depends on server/session rules |
| Gap expectedness | Weekend/holiday in **market** calendar, not only UTC calendar |
| Session features | London/NY overlap etc. need session map |
| Reconciliation | Compare like-for-like bar opens |

## Rules

- Changing timezone policy version requires re-evaluation of affected derived bars and gap classifications.
- Canonical storage keys remain `utc_timestamp`; policy affects interpretation and higher-TF derivation.
