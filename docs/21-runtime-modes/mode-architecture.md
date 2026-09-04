---
id: DOC-PATH-21-RUNTIME-MODES-MODE-ARCHITECTURE-MD
title: Mode Architecture
status: reviewed
version: 0.5
phase: 0
domain: 21-runtime-modes
---

# Runtime Modes (minimum)

```text
OFFLINE_RESEARCH
TRAINING
VALIDATION
PAPER
LIVE_ANALYSIS
LIVE_TRADING
SAFE_MODE
```

Each mode defines: allowed components, forbidden components, resource budget, state transitions, exit conditions.

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

