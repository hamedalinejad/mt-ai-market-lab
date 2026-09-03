---
id: DOC-SCHEMA-sqlite-ddl
title: SQLite DDL Target
status: reviewed
version: 0.6
phase: 0
domain: contracts
---

# Physical SQLite DDL Target

Implementation generates versioned migrations from logical schema. Example uniqueness: `order_intent.client_order_id UNIQUE`. WAL required. Single-writer policy.
