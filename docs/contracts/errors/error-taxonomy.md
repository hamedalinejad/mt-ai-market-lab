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
