---
id: DOC-STOR-015
title: Storage Benchmark
status: draft
version: 0.2
phase: 0
domain: 04-storage
created: 2026-09-01
updated: 2026-09-02
depends_on: [ADR-0004]
related: [DOC-TEST-004]
---

# Storage Benchmark Specification

Workloads:

```text
1M / 10M / 100M rows
random read | range read | append | upsert
compression | concurrent read | recovery | disk usage
```

Storage selection remains Benchmark-driven per ADR.
