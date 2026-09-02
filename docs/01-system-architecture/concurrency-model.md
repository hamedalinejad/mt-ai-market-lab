---
id: DOC-ARCH-010
title: Concurrency Model
status: draft
version: 0.2
phase: 0
domain: 01-system-architecture
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-RUN-001]
related: [DOC-STOR-016]
---

# Concurrency Model

## Direction (example)

```text
1 process boundaries as needed
N ingestion workers
1 storage writer (SQLite single-writer)
N analysis workers
1 model manager
1 discovery worker (budgeted)
```

Document what is thread-safe. Analytics (DuckDB) and ingestion have clear boundaries; unlimited concurrent writers forbidden.
