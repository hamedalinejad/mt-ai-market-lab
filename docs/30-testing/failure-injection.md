---
id: DOC-TEST-003
title: Failure Injection Testing
status: draft
version: 0.2
phase: 0
domain: 30-testing
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-TEST-001]
related: [DOC-SAFE-002, DOC-OPS-001]
---

# Failure Injection

Simulate intentionally:

```text
MT5 disconnect | Database locked | Disk full
Corrupt row | Missing tick | Duplicate tick
Model crash | RAM exhaustion | Network failure | Order timeout
```
