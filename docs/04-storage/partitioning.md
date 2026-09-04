---
id: DOC-PATH-04-STORAGE-PARTITIONING-MD
title: Data Partitioning
status: draft
version: 0.2
phase: 0
domain: 04-storage
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-STOR-014]
related: [DOC-STOR-015]---

# Data Partitioning

Candidate keys:

```text
asset_class / symbol / timeframe / year / month
```

or

```text
symbol / year / timeframe
```

Final layout chosen via Storage Benchmark.

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


<!-- merged from docs/04-storage/partition-policy.md -->

# Partition Policy

## Candidate keys (until Benchmark selects one)
```text
symbol / timeframe / year / month
```
or `asset_class / symbol / timeframe / year / month`

## Acceptance Benchmark (mandatory before lock)
```text
1M rows | 10M | 100M
1 year M1
multi-symbol
tick-heavy
```
Metrics: append, range read, random read, compression, disk, concurrent read, recovery time.

**status remains reviewed until Benchmark results written and policy set to approved.**

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

