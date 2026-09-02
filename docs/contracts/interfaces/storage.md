---
id: DOC-CONTRACT-IF-storage
title: Interface — Storage
status: draft
version: 0.2
phase: 0
domain: contracts
---

# Interface: Storage

## Methods

put_raw, put_canonical, get_range, query_analytics_hook, checkpoint, backup_hook

## Concurrency

SQLite: single-writer. Parquet: append/partition policy. DuckDB: analytics boundary.
