---
id: DOC-PATH-10-AI-CORE-PREDICTOR-LEARNER-DISCOVERER-MD
title: Predictor Learner Discoverer
status: reviewed
version: 0.3
phase: 0
domain: 10-ai-core
updated: 2026-09-03
---

# Three Roles (binding)

| Role | Responsibility | Must not |
|------|----------------|----------|
| **Predictor** | feature snapshot → Prediction | mutate production weights; run unbounded search |
| **Learner** | outcomes → candidate updates under governance | promote itself; full discovery search |
| **Discoverer** | search space → Discovery Candidates | write champion model; emit orders |

No component may own all three without **hard module boundaries** and separate process budgets (Live vs Research).

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

