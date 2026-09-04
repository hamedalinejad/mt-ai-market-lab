---
id: DOC-PATH-04-STORAGE-PARTITION-POLICY-MD
title: Partition Policy
status: reviewed
version: 0.3
phase: 0
domain: 04-storage
---

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

