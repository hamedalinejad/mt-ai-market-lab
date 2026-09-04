---
id: DOC-OPS-MERGED-001
title: operations
status: reviewed
phase: 0
---
> **Note:** Domain narrative consolidated from multiple former files. Binding contracts remain under `docs/contracts/`. Sections marked TBD are not Phase-0 binding.


# operations


<!-- merged from docs/28-operations/environment.md -->

# environment

## Purpose

Specification for **environment** within the 28-operations domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD

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


<!-- merged from docs/28-operations/version-compatibility.md -->

# Version Compatibility Matrix

Track tested combinations of:

```text
Python | MetaTrader5 package | MT5 Terminal
DuckDB | SQLite | NumPy | Pandas/Polars | …
```

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


<!-- merged from docs/28-operations/troubleshooting.md -->

# troubleshooting

## Purpose

Specification for **troubleshooting** within the 28-operations domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD

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


<!-- merged from docs/28-operations/environment-validation.md -->

# Environment Validation

Startup reports:

```text
Python OK | MT5 OK | Database OK | Disk OK | RAM OK | Model OK | Data OK
```

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


<!-- merged from docs/28-operations/shutdown.md -->

# Shutdown

## Normative Sequence

```text
stop live ingestion
flush buffers
commit DB
checkpoint
persist sync state
persist model state (shadow/runtime pointers)
persist runtime state
close MT5
```

## Rules

- Dirty shutdown is recovered by Startup Recovery; clean shutdown minimizes recovery work.
- Never leave partial canonical publishes without rolling back or marking incomplete batches.

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


<!-- merged from docs/28-operations/maintenance.md -->

# maintenance

## Purpose

Specification for **maintenance** within the 28-operations domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD

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


<!-- merged from docs/28-operations/recovery-operations.md -->

# recovery operations

## Purpose

Specification for **recovery operations** within the 28-operations domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD

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


<!-- merged from docs/28-operations/synchronization-operations.md -->

# synchronization operations

## Purpose

Specification for **synchronization operations** within the 28-operations domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD

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


<!-- merged from docs/28-operations/retry-policy.md -->

# Retry Policy

Not every error is retried.

| Example | Action |
|---------|--------|
| connection timeout | retry |
| invalid symbol | do not retry |
| corrupt data | quarantine |
| database locked | backoff |
| disk full | stop / Safe Mode |

## Exponential Backoff

For MT5, network, external source, storage contention.

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


<!-- merged from docs/28-operations/installation.md -->

# Installation

Must document:

```text
Windows
Python version
MT5 version
Broker notes
Virtual environment
Dependencies
Data directory
First run
MT5 configuration
Permissions
```

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


<!-- merged from docs/28-operations/monitoring.md -->

# monitoring

## Purpose

Specification for **monitoring** within the 28-operations domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD

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


<!-- merged from docs/28-operations/concurrency-model.md -->

# Concurrency Model

Example direction:

```text
1 process boundaries (Live vs Training)
N ingestion workers
1 storage writer (SQLite single-writer)
N analysis workers
1 model manager
1 discovery worker (budgeted)
```

What is thread-safe must be declared per component.

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


<!-- merged from docs/28-operations/dependency-policy.md -->

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


<!-- merged from docs/28-operations/backup-operations.md -->

# Backup Architecture

## Coverage

```text
Database | Raw Data | Canonical Data
Models | Features | Experiments | Knowledge | Configs
```

## Metadata

```text
backup_id
timestamp
source_version
checksum
```

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

