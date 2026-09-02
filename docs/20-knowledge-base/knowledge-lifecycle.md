---
id: DOC-KNOW-016
title: Knowledge Lifecycle
status: draft
version: 0.2
phase: 0
domain: 20-knowledge-base
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-KNOW-001]
related: [DOC-VAL-015]
---

# Knowledge Lifecycle (State Machine)

```text
UNKNOWN → CANDIDATE → EXPERIMENTAL → VALIDATED → ACTIVE
  → DEGRADED → RETIRED

REJECTED  (branch)
```

## Evidence rule

No Knowledge becomes **ACTIVE** without `evidence_ids`.
