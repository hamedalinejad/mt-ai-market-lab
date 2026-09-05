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

**Results table:** empty until measured (must not invent numbers) — do not invent numbers in docs.

## Acceptance Criteria

```text
AC-BENCH-01
Given a storage choice is proposed as Approved technology
When ADR is written
Then it must cite measured results from this protocol
```


<!-- merged from docs/04-storage/storage-benchmark.md -->

# Storage Benchmark Specification

Workloads:

```text
1M / 10M / 100M rows
random read | range read | append | upsert
compression | concurrent read | recovery | disk usage
```

Storage selection remains Benchmark-driven per ADR.

## Acceptance Criteria

```text
AC-01
Given this document is binding for its domain
When an implementer builds against it
Then behavior must satisfy the stated invariants and contracts herein
And violations fail validation or static gates before promotion
```

```text
AC-02
Given status is not approved
When production code for this scope is proposed
Then it must be rejected until status reaches approved
```


<!-- merged from docs/04-storage/storage-benchmarks.md -->

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

## Acceptance Criteria

```text
AC-01
Given this document is binding for its domain
When an implementer builds against it
Then behavior must satisfy the stated invariants and contracts herein
And violations fail validation or static gates before promotion
```

```text
AC-02
Given status is not approved
When production code for this scope is proposed
Then it must be rejected until status reaches approved
```

