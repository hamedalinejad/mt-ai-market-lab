---
id: DOC-PROJ-014
title: Remaining Spec Gaps Checklist
status: reviewed
version: 0.2
phase: 0
domain: 00-project
---

# Still to deepen before / during early implementation

## Documentation
requirement IDs, acceptance criteria on every P0, formal glossary, interface compatibility, schema migration, deprecation, ADR supersession

## Data
point-in-time availability, source event ordering, event IDs, broker calendar versioning, revision handling, quality score, provenance graph

## ML
dataset snapshots, label leakage checks, calibration, drift thresholds, champion/challenger policy, rollback automation, online learning budget

## Discovery
AST schema, search DSL, equivalence engine, multiple-testing accounting, complexity metric, candidate ranking/archive

## Trading
account state, position SM, order lifecycle, execution timeout, broker reconciliation, emergency close

## Operations
watchdog, health score, safe mode, recovery playbook, backup verification, restore drill

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

