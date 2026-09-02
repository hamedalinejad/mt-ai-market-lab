---
id: DOC-DISC-006
title: Discovery Space / Search Grammar
status: reviewed
version: 0.4
phase: 0
domain: 13-discovery-engine
updated: 2026-09-03
---

# Search Grammar (machine-readable target)

Versioned grammar document (`space_version`) enumerates:

```text
variables
operators
constants
window functions
conditionals
comparators
boolean operators
thresholds
aggregation
cross-timeframe
cross-asset
```

Implementations load grammar as data (JSON/YAML schema later); engines must not hard-code ad-hoc operator sets outside `space_version`.
