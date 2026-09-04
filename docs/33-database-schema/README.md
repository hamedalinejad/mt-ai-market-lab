---
id: DOC-33-README
title: Database Schema Domain
status: reviewed
version: 0.3
---

# KEEP — two layers

1. Domain narrative (this folder)  
2. Binding schema under `docs/contracts/schemas/` + migration-contract.md  

Do not delete; avoid duplicate authority.

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

