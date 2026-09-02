---
id: DOC-AI-016
title: Predictor Learner Discoverer
status: draft
version: 0.2
phase: 0
domain: 10-ai-core
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-AI-001, DOC-DISC-001]
---

# Three Systems

| System | Role |
|--------|------|
| **Predictor** | known features → forecast |
| **Learner** | update from outcomes under governance |
| **Discoverer** | search new feature/pattern/formula/relationship |

Do **not** merge Learner and Discoverer.

## Parallel paths

```text
                 Market State
                      │
          ┌───────────┴───────────┐
          ▼                       ▼
      Prediction              Discovery
          │                       │
          ▼                       ▼
     Forecast                Candidate
          │                       │
          └──────────┬────────────┘
                     ▼
                Validation
```
