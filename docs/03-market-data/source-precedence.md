---
id: DOC-DATA-027
title: Source Precedence
status: draft
version: 0.2
phase: 0
domain: 03-market-data
created: 2026-09-02
updated: 2026-09-02
depends_on: [DOC-CONTRACT-IF-001]
---

# Source Precedence

When multiple providers supply the same identity:

```text
policy-ordered sources → conflict → quarantine or prefer higher-precedence with audit
```

Never silently mix without `origin` / source field.
