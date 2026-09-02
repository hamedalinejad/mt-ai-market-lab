---
id: DOC-AI-013
title: Model Lifecycle
status: draft
version: 0.2
phase: 0
domain: 10-ai-core
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-AI-014, DOC-VAL-015]
related: [DOC-AI-012]
---

# Model Lifecycle

## Git-like states

```text
candidate → validated → shadow → active → degraded → retired
```

## Rollback

```text
active v8 → bad → rollback → active v7
```

Promotion and rollback are explicit, versioned, event-logged. Weights are never edited in place.
