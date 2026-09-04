---
id: DOC-CONTRACT-ERR-001
title: Error Taxonomy
status: draft
version: 0.2
phase: 0
domain: contracts
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-CONTRACT-001]
related: [DOC-OPS-003]
---

# Error Taxonomy

Examples:

```text
MT5ConnectionError | MT5DataError | SymbolUnavailableError
DataGapError | DataIntegrityError | StorageError | SyncError
ModelError | DiscoveryError | ValidationError | RiskError | ExecutionError
```

Each classifies as:

```text
retryable | non_retryable | fatal | recoverable
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

