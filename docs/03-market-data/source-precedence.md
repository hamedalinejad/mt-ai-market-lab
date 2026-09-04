---
id: DOC-DATA-027
title: Source Precedence
status: reviewed
version: 0.3
phase: 0
domain: 03-market-data
---

# Source Precedence (deterministic)

```text
1 Primary source (e.g. live MT5 for that instrument)
2 Secondary source
3 Import source (CSV/Parquet bulk)
4 Diagnostic source
```

Conflicts: higher wins for canonical publish; lower quarantined or stored as alternate origin with audit. Never silent mix.

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

