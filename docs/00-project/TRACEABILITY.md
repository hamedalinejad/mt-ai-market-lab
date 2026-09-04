---
id: DOC-PROJ-032
title: Traceability
status: reviewed
version: 0.2
phase: 0
domain: 00-project
---

# Traceability Matrix (skeleton)

| Requirement | Contract | Spec | ADR | Test | Evidence |
|-------------|----------|------|-----|------|----------|
| REQ-DATA-* | docs/contracts/data | domain 03/04/05 | ADR storage/MT5 | contract/data tests | TBD |
| REQ-SYNC-* | sync interfaces | 05-synchronization | — | recovery tests | TBD |
| REQ-AI-* | model/prediction | 10/12 | ADR AI | model tests | TBD |
| REQ-DISC-* | discovery candidate | 13 | — | discovery tests | TBD |
| REQ-VAL-* | validation | 15 | — | leakage/static | TBD |
| REQ-TRD-* | signal/risk/order | 16–19 | — | execution tests | TBD |
| REQ-OPS-* | modes/ops | 21/28 | — | recovery | TBD |

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

