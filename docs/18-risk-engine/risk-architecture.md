---
id: DOC-RISK-001
title: Risk Architecture
status: reviewed
version: 0.6
phase: 0
domain: 18-risk-engine
updated: 2026-09-04
---

# Risk Absolute Authority (BUG-TRD-P0-002)

```text
Prediction → Signal → Strategy → Risk → Execution
```

Risk returns `ALLOW | REDUCE | DENY | HALT`.

**AI must never override Risk.** Even 99% model confidence cannot force ALLOW past Risk.
