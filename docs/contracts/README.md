---
id: DOC-CONTRACT-001
title: Contracts — Source of Truth
status: reviewed
version: 0.7
---

```text
docs/contracts/
├── data/
├── interfaces/
├── events/
├── schemas/
├── database/
├── errors/
└── README.md
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



> Domain folders 31–35 removed; contracts here are the only SoT.
