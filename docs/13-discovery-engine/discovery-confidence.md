---
id: DOC-DISC-003
title: Discovery Confidence
status: draft
version: 0.2
phase: 0
domain: 13-discovery-engine
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-DISC-010]
related: [DOC-DISC-001]
---

# Discovery Confidence

Composite (example axes):

```text
Novelty, OOS, Stability, Complexity (penalty), Turnover, Regime stability
→ Discovery Confidence
```

Never a substitute for Validation gates. Discovery never enters production directly:

```text
Discovery → Candidate → Experiment → Validation → Paper → Shadow → Promotion
```
