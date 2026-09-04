---
id: DOC-DISC-005
title: Discovery Objectives
status: draft
version: 0.2
phase: 0
domain: 13-discovery-engine
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-DISC-001, DOC-MASTER-001]
related: [DOC-DISC-006, DOC-VAL-001]
---

# Discovery Objectives

## Purpose

State what Discovery **can and cannot** claim.

## What Cannot Be Guaranteed

The system **cannot guarantee** that it will:

- always find something new
- always find something true
- always find something profitable
- recover the “real” causal structure of markets

These are not engineering SLAs; they are scientific impossibilities to promise.

## What We Design For

A **systematic, automated, reproducible** search over a versioned hypothesis space, where every Discovery is a **Candidate** subjected to strict statistical and economic evaluation.

Aligned with project philosophy:

> Discovery ≠ Truth  
> Validation Before Promotion  
> Failed Candidates are retained

## Success Criteria for the Discovery subsystem

| Criterion | Meaning |
|-----------|---------|
| Coverage | Search runs consume budget with logged space version |
| Reproducibility | Same seed + data + space → same Candidate set |
| Discipline | No Candidate skips Validation gates |
| Learning | Failures feed memory; space not blindly expanded |
| Resource honesty | Search respects laptop priority policy |

## Rules

- Marketing language in docs must not imply guaranteed edge discovery.
- Research reports must separate “search activity” from “validated knowledge.”

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

