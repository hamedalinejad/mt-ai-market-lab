---
id: DOC-30-README
title: Testing Domain
status: reviewed
version: 0.2
---

# 30-testing

Test architecture, static gates, failure injection, suite templates.  
Contracts tree check: `scripts/check_contracts_tree.sh`

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

