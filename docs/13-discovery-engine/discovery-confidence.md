---
id: DOC-DISC-003
title: Discovery Confidence
status: draft
version: 0.2
phase: 0
domain: 13-discovery-engine
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-DISC-010]
related: [DOC-DISC-001]
---

# Discovery Confidence

Composite (example axes):

```text
Novelty, OOS, Stability, Complexity (penalty), Turnover, Regime stability
→ Discovery Confidence
```

Never a substitute for Validation gates. Discovery never enters production directly:

```text
Discovery → Candidate → Experiment → Validation → Paper → Shadow → Promotion
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

