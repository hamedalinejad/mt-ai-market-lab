---
id: DOC-MT5-015
title: Symbol Selection
status: reviewed
version: 0.4
phase: 0
domain: 02-metatrader
---

# Symbol Lifecycle States

```text
discovered → selected → verified → available
disabled (orthogonal / terminal state)
```

| State | Meaning |
|-------|---------|
| discovered | seen via symbols_get / scan |
| selected | in operator config allowlist |
| verified | metadata snapshot ok |
| available | Market Watch + data path ready |
| disabled | explicitly off |

Pipelines only on **available** (unless research override).
