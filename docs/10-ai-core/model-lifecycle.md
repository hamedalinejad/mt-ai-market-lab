---
id: DOC-AI-013
title: Model Lifecycle
status: draft
version: 0.2
phase: 0
domain: 10-ai-core
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-AI-014]
related: [DOC-AI-015]
---

# Model Lifecycle

```text
candidate → validated → shadow → active → degraded → retired
```

## Champion / Challenger

Active **champion** serves production. **Challenger** runs in shadow until Promotion criteria pass. Rollback restores prior champion version immutably.
