---
id: DOC-STOR-015
title: Storage Benchmarks
status: draft
version: 0.2
phase: 0
domain: 04-storage
created: 2026-09-01
updated: 2026-09-02
depends_on: [ADR-0004]
related: [DOC-TEST-004]
---

# Storage Benchmarks

Required scenarios before locking storage tech:

```text
1M / 10M / 100M rows
random read | range read
append | upsert
compression
concurrent read
recovery
disk usage
```

Results feed ADR-0004 decision, not intuition.
