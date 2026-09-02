---
id: DOC-MT5-009
title: Integration Boundary
status: draft
version: 0.2
phase: 0
domain: 02-metatrader
created: 2026-09-01
updated: 2026-09-02
depends_on: [ADR-0008]
related: [DOC-CONTRACT-IF-001]
---

# MT5 Integration Boundary

## MT5Adapter is the only gateway

No domain may call:

```text
mt5.copy_rates_range(...)
```

directly. Path:

```text
MT5 Adapter → Canonical Market Schema → rest of system
```

Canonical data is **source-neutral**. AI never binds to MT5 namedtuples.
