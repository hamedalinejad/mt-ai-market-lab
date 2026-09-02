---
id: DOC-CONTRACT-IF-storage
title: Interface — Storage
status: reviewed
version: 0.4
phase: 0
domain: contracts
---

# Storage

## Boundaries
SQLite control plane | Parquet canonical | DuckDB analytics (read)

## Methods
put_raw, put_canonical (after validate), get_range, publish_batch (atomic order), quarantine_put, manifest_write/read

## Atomic publish order
staging → validate → checksum → publish → sync_state/manifest update

## Single-writer SQLite; idempotent canonical upsert by logical identity
