---
id: DOC-STOR-032
title: Storage Benchmark Protocol
status: approved
version: 0.2
phase: 0
domain: 04-storage
---

# Benchmark Protocol (no fabricated results)

Workloads to measure before locking partition/compression/RAM:

```text
1M / 10M / 100M rows
1 year M1 single symbol
multi-symbol
tick-heavy
```

Metrics: append, range read, random read, compression ratio, disk, concurrent read, recovery time.

**Results table:** TBD after measurement — do not invent numbers in docs.

## Acceptance Criteria

```text
AC-BENCH-01
Given a storage choice is proposed as Approved technology
When ADR is written
Then it must cite measured results from this protocol
```
