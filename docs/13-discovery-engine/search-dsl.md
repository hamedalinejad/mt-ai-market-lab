---
id: DOC-DISC-024
title: Search DSL
status: reviewed
version: 0.2
phase: 0
domain: 13-discovery-engine
updated: 2026-09-04
---

# Search DSL (BUG-DISC-P0-002)

Versioned `grammar_version` defines:

```text
grammar / productions
literals
typing
units / semantic types
allowed depth
invalid expressions catalog
```

## Runtime safety (must reject or safe-fail)
```text
division by zero
log of negative
sqrt of negative
overflow
NaN propagation
```

Invalid expressions never become promotable candidates.
