---
id: DOC-AI-012
title: Online and Continual Learning
status: approved
version: 1.0
phase: 0
domain: 10-ai-core
created: 2026-09-04
updated: 2026-09-04
depends_on: ['DOC-PROJ-052', 'DOC-CONTRACT-IF-model']
---

# Online Learning Policy

**Not** “blindly overwrite the live model after every observation.”

```text
new data → monitor → collect → check drift/quality
  → create learner candidate → compare with champion
  → validate → shadow → promote or reject
```

Every promotion requires **rollback metadata**. Champion stays intact until challenger passes applicable gates.
