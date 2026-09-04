---
id: DOC-AI-017
title: Drift Detection
status: reviewed
version: 0.5
phase: 0
domain: 10-ai-core
updated: 2026-09-04
---

# Drift Taxonomy + Threshold Contract (BUG-AI-P0-010)

| Type | Notes |
|------|--------|
| feature drift | input feature distribution |
| label drift | label distribution |
| prediction drift | output distribution |
| residual drift | error residual distribution |
| concept drift | P(y\|x) change |

Each type requires versioned:
```text
metric
reference_window
current_window
threshold
action              # alert | degrade | shadow-retrain | rollback | …
```

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

