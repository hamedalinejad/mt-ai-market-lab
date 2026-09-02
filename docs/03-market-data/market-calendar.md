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
