---
id: DOC-DISC-001
title: Discovery Architecture
status: draft
version: 0.2
phase: 0
domain: 13-discovery-engine
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-MASTER-001]
related: [DOC-DISC-006, DOC-DISC-014, DOC-EXPL-001, DOC-VAL-001]
---

# Discovery Architecture

## Purpose

Discovery produces **Candidates only** (patterns, formulas, relationships, regimes, …).

## Pipeline

```text
Discovery Space → Search → Candidate Generation
  → Duplicate / Novelty Check → Ranking
  → Experiment Lab → Validation → Knowledge (optional)
```

## Pattern Levels

1. Known patterns  
2. Parameterized patterns  
3. Unknown structures  

## Formula / Indicator Search

Uses versioned variable and operator space; classic indicators are baselines, not the ceiling.

## Hard Rules

- Discovery ≠ Truth  
- Discovery ≠ Order  
- Failed Candidates retained for memory  
