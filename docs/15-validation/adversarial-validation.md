---
id: DOC-PATH-15-VALIDATION-ADVERSARIAL-VALIDATION-MD
title: Adversarial Validation
status: draft
version: 0.2
phase: 0
domain: 15-validation
created: 2026-09-01
updated: 2026-09-02
depends_on: [ADR-0012, DOC-VAL-022]
related: [DOC-VAL-015]
---

# Adversarial Validation

## Purpose

Actively try to break the Candidate before Promotion.

## Attack families (candidates)

- Parameter perturbation  
- Time window shift  
- Regime stress  
- Bootstrap / resampling  
- Noise injection  
- Feature removal  
- Alternate splits  
- Cost/slippage stress  
- Symbol / timeframe transfer  

## Rules

- Soft Candidates that fail adversarial suite do not Promote.
- Attacks and outcomes are logged for audit.

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

