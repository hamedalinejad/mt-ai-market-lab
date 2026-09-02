---
id: DOC-STOR-022
title: Compaction Engine
status: draft
version: 0.2
phase: 0
domain: 04-storage
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-STOR-021]
related: [DOC-RES-009]
---

# Compaction Engine

```text
many small files → merge → optimize
```

Resource-aware; never blocks P0 data integrity or live path without policy.
