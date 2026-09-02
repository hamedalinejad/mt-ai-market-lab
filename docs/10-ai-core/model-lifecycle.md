---
id: DOC-AI-013
title: Model Lifecycle
status: reviewed
version: 0.4
phase: 0
domain: 10-ai-core
---

# Champion / Challenger / Shadow State Machine

```text
CANDIDATE → VALIDATED → SHADOW → CHAMPION → DEGRADED → RETIRED
                ↘ REJECTED
```

| State | Role |
|-------|------|
| CANDIDATE | trained / proposed |
| VALIDATED | passed gate set |
| SHADOW | parallel inference, no production authority |
| CHAMPION | production (active) |
| DEGRADED | still loaded but limited / warned |
| RETIRED | immutable archive |
| REJECTED | failed gates; retained for memory |

Challenger = SHADOW competing with CHAMPION. Rollback: CHAMPION → prior version CHAMPION.
