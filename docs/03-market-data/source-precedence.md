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
