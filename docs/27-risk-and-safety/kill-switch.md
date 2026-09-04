---
id: DOC-SAFE-003
title: Kill Switch / Emergency Close
status: reviewed
version: 0.3
phase: 0
domain: 27-risk-and-safety
updated: 2026-09-04
---

# Emergency Close Independent of Model (BUG-TRD-P0-008)

Kill switch / emergency close must operate even if:

```text
model crash
feature crash
discovery deadlock
```

Independent process/path from Predictor/Discoverer. Can HALT trading and force flatten/close per policy.
