---
id: DOC-VAL-023
title: Validation Philosophy
status: draft
version: 0.2
phase: 0
domain: 15-validation
created: 2026-09-01
updated: 2026-09-02
depends_on: [ADR-0005]
related: [DOC-VAL-022, DOC-VAL-014]
---

# Validation Philosophy

## Principles

1. **Validation Before Promotion**
2. **Candidates from large searches are guilty of snooping until corrected**
3. **Economic realism** (cost, slippage) before any trading claim
4. **Reject is a success mode** — saves capital and knowledge pollution
5. **No guarantee of true discovery** — only controlled error rates and evidence quality

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

