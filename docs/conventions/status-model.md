---
id: DOC-CONV-005
title: Document Status Model
status: approved
version: 0.5
phase: 0
domain: conventions
updated: 2026-09-04
depends_on: ['DOC-PROJ-050']
related: ['DOC-CONV-011']
---

# Status Lifecycle

```text
draft → reviewed → approved → implemented → verified → deprecated
```

## Approval rule (from Implementation Baseline)

`approved` requires complete normative content for the claimed scope:

- requirements, invariants, interfaces, domain ACs, resolvable dependencies;
- **no TBD/TODO** as open design for that scope.

Otherwise keep `reviewed` or `draft`.

**Coding** for a slice starts only when that slice’s **binding** docs are `approved` (see `implementation-baseline.md`).

Narrative domain indexes may stay `reviewed` indefinitely.
