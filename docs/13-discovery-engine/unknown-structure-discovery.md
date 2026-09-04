---
id: DOC-PATH-13-DISCOVERY-ENGINE-UNKNOWN-STRUCTURE-DISCOVERY-MD
title: Unknown Structure Discovery
status: reviewed
version: 0.3
phase: 0
domain: 13-discovery-engine
---

# Unknown Structure — Explainable Output

Required payload:

```text
Observed context
Candidate structure
Why novel
Performance
Stability
Evidence
Failure cases
```

No black-box “cluster id” alone as a promotable discovery claim.

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

