---
id: DOC-OPS-008
title: Dependency Policy
status: draft
version: 0.2
phase: 0
domain: 28-operations
created: 2026-09-01
updated: 2026-09-02
depends_on: [ADR-0003]
---

# Dependency Policy

For each dependency document:

```text
why | version range | license | performance | risk | alternative
```

Libraries (NumPy/Pandas/Polars/…) are **implementation details**, not Architecture Truth.

Polars vs Pandas: Benchmark-based for DataFrame-heavy workloads.

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

