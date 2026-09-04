---
id: DOC-PATH-16-SIGNAL-ENGINE-SIGNAL-VS-STRATEGY-MD
title: Signal vs Strategy Separation
status: reviewed
version: 0.2
phase: 0
domain: 16-signal-engine
updated: 2026-09-04
---

# Signal ≠ Strategy (BUG-TRD-P0-001)

| Layer | Meaning |
|-------|---------|
| **Signal** | What was observed / inferred and with what confidence |
| **Strategy** | What action policy is proposed given signals + context |

Must not merge into one object. Strategy consumes signals; signals do not embed order instructions.

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

