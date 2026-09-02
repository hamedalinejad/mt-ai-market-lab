---
id: DOC-DISC-009
title: Genetic Programming
status: draft
version: 0.2
phase: 0
domain: 13-discovery-engine
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-DISC-006]
related: [DOC-DISC-020, DOC-DISC-019, DOC-STRAT-001]
---

# Genetic Programming

## Purpose

**Separate tool** from Symbolic Regression.

### Goal

```text
evolve expression / rule / strategy
```

GP may evolve:

- expressions (overlap with SR only as a *search algorithm* option for formulas)
- conditional rules
- feature compositions
- strategy structure skeletons (entry/exit logic trees)

When GP is used only to search `f(X)→Y`, document that run as **GP-backed symbolic search**, but the **module boundaries** remain distinct.

## Requirements

- Seed, population, operators, selection logged
- Hard complexity caps (nodes, conditions, nesting)
- Resource-aware population sizes
- Identical Validation and multiple-testing accounting as other searches

## Rules

- GP strategy Candidates are not executable live without Strategy + Risk + Paper gates.
- Nesting limits prevent 17-level operator trees as default-legal.
