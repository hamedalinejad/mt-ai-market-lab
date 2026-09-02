---
id: DOC-STOR-022
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
