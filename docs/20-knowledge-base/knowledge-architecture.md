---
id: DOC-KNOW-001
title: Knowledge Architecture
status: draft
version: 0.2
phase: 0
domain: 20-knowledge-base
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-MASTER-001]
related: [DOC-KNOW-016, DOC-SIG-012, DOC-EXPL-003]
---

# Knowledge Architecture

## Purpose

Knowledge is **not** a pile of free text. It is a **graph-like** network of typed nodes and edges with lifecycle status.

## Graph Sketch

```text
Discovery D123
   ↓
Feature F87
   ↓
Pattern P32
   ↓
Signal S45
   ↓
Strategy ST12
   ↓
Experiment E900
   ↓
Validation V300
   ↓
Outcome O500
```

## Node Types (examples)

```text
Discovery, Feature, Pattern, Indicator, Formula
PredictionModel, Signal, Strategy, Experiment
ValidationRun, Outcome, Failure, KnowledgeArticle
```

## Edge Types (examples)

```text
derived_from
uses_feature
supports
contradicts
validated_by
produced
failed_as
supersedes
```

## Rules

- Promotion moves **node status**, not “save a paragraph.”
- Traceability walks the graph; orphan signals without edges are non-compliant for material use.
- Text notes may annotate nodes; they are not a substitute for typed links.
