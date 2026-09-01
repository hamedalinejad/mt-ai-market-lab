---
id: DOC-STOR-001
title: Storage Overview
status: draft
version: 0.1
phase: 0
domain: 04-storage
created: 2026-09-01
updated: 2026-09-01
depends_on: []
related: []
---

# Storage Overview

## Purpose

Overview and entry point for the **04-storage** domain of `mt-ai-market-lab`.

## Scope

Phase 0 — Documentation First. Specifications only; no production code.

## Status

All documents in this domain are currently in `draft` status.

## Hybrid candidate (Phase 0 direction)

See `storage-architecture.md` and ADR-0004:

- **SQLite** — metadata / sync state (`state/market_lab.sqlite`)
- **Parquet** — multi-year canonical market + features (`data/canonical/...`)
- **DuckDB** — analytics over Parquet (+ optional SQLite attach)

SQLite alone is **not** the data lake.
