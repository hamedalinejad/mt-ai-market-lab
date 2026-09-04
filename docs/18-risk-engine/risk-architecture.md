---
id: DOC-PATH-18-RISK-ENGINE-RISK-ARCHITECTURE-MD
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

