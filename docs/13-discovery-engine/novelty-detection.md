---
id: DOC-DISC-013
title: Novelty Detection
status: reviewed
version: 0.5
phase: 0
domain: 13-discovery-engine
updated: 2026-09-04
---

# Novelty Metric (BUG-DISC-P0-006)

Composite (versioned weights/thresholds):

```text
structural_novelty
temporal_novelty
asset_novelty
performance_novelty
→ novelty_score
```

Policy_version pins metric definition and thresholds.

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

