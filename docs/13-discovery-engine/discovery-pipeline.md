---
id: DOC-DISC-027
title: Discovery Pipeline
status: reviewed
version: 0.2
phase: 0
domain: 13-discovery-engine
updated: 2026-09-04
---

# Discovery must not produce Signals directly (BUG-DISC-P0-008)

```text
Candidate
 → Quick Evaluation
 → Robust Validation
 → Knowledge
 → Promotion
 → Optional Feature / Model / Signal input
```

No skip from Candidate to live Signal/Order path.

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

