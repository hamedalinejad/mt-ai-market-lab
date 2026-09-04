---
id: DOC-CONV-010
title: Technology Decision State
status: reviewed
version: 0.2
phase: 0
domain: conventions
---

# Requirement → Candidate → Benchmark → ADR → Approved (B-005)

SQLite/Parquet/DuckDB, ML libraries, symbol counts, RAM numbers are **Candidates** until Benchmark + ADR approval.

Do not treat candidate stacks as locked architecture truth.

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

