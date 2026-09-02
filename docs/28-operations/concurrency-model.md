---
id: DOC-OPS-004
title: Concurrency Model
status: draft
version: 0.2
phase: 0
domain: 28-operations
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-RUN-001]
related: [DOC-STOR-016]
---

# Concurrency Model

Example direction:

```text
1 process boundaries (Live vs Training)
N ingestion workers
1 storage writer (SQLite single-writer)
N analysis workers
1 model manager
1 discovery worker (budgeted)
```

What is thread-safe must be declared per component.
