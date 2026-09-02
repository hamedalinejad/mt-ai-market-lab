---
id: DOC-TEST-001
title: Testing Architecture
status: draft
version: 0.2
phase: 0
domain: 30-testing
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-MASTER-001]
related: [DOC-TEST-002, DOC-TEST-003]
---

# Testing Architecture

## Planned tree

```text
tests/
├── unit/
├── integration/
├── contract/
├── data/
├── replay/
├── backtest/
├── model/
├── discovery/
├── execution/
├── recovery/
├── performance/
└── end-to-end/
```

Phase 0 documents these suites; implementation follows Documentation First.
