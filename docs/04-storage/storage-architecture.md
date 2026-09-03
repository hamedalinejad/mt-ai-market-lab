---
id: DOC-STOR-014
title: Storage Architecture
status: reviewed
version: 0.5
phase: 0
domain: 04-storage
---

# Boundaries

SQLite = control plane · Parquet = canonical history · DuckDB = analytics

Lifecycle dirs: see [data-lifecycle-layout.md](data-lifecycle-layout.md)  
Revisions: see [revision-policy.md](revision-policy.md)
