---
id: DOC-CONTRACT-DATA-risk-decision
title: Risk Decision Contract
status: approved
version: 1.0
phase: 0
domain: contracts
created: 2026-09-04
updated: 2026-09-04
depends_on: ['DOC-RISK-001']
---

# Risk Decision

```text
risk_decision_id, outcome (ALLOW|REDUCE|DENY|HALT),
reasons[], inputs_snapshot_ref, policy_version,
valid_from, valid_until, created_at
```

Stale decisions (past `valid_until`) must not authorize execution.
