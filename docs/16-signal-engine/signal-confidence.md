---
id: DOC-SIG-003
title: Signal Confidence
status: draft
version: 0.2
phase: 0
domain: 16-signal-engine
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-PRED-003, DOC-SIG-001]
related: [DOC-SIG-002]
---

# Signal Confidence

```text
raw_model_score → calibrated_probability → decision_score
```

Signal confidence is calibrated and evidence-aware, not a raw model dump.

## Acceptance Criteria

```text
AC-01
Given this document is binding for its domain
When an implementer builds against it
Then behavior must satisfy the stated invariants and contracts herein
And violations fail validation or static gates before promotion
```

```text
AC-02
Given status is not approved
When production code for this scope is proposed
Then it must be rejected until status reaches approved
```

