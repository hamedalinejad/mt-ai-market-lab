---
id: DOC-MERGED
title: knowledge
status: reviewed
phase: 0
---

# knowledge


<!-- merged from docs/20-knowledge-base/active-knowledge.md -->

# active knowledge

## Purpose

Specification for **active knowledge** within the 20-knowledge-base domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/20-knowledge-base/knowledge-lifecycle.md -->

# Knowledge Lifecycle (State Machine)

```text
UNKNOWN → CANDIDATE → EXPERIMENTAL → VALIDATED → ACTIVE
  → DEGRADED → RETIRED

REJECTED  (branch)
```

## Evidence rule

No Knowledge becomes **ACTIVE** without `evidence_ids`.


<!-- merged from docs/20-knowledge-base/knowledge-model.md -->

# knowledge model

## Purpose

Specification for **knowledge model** within the 20-knowledge-base domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/20-knowledge-base/indicator-knowledge.md -->

# indicator knowledge

## Purpose

Specification for **indicator knowledge** within the 20-knowledge-base domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/20-knowledge-base/uncertain-knowledge.md -->

# uncertain knowledge

## Purpose

Specification for **uncertain knowledge** within the 20-knowledge-base domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/20-knowledge-base/retired-knowledge.md -->

# retired knowledge

## Purpose

Specification for **retired knowledge** within the 20-knowledge-base domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/20-knowledge-base/degraded-knowledge.md -->

# degraded knowledge

## Purpose

Specification for **degraded knowledge** within the 20-knowledge-base domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/20-knowledge-base/strategy-knowledge.md -->

# strategy knowledge

## Purpose

Specification for **strategy knowledge** within the 20-knowledge-base domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/20-knowledge-base/rejected-knowledge.md -->

# rejected knowledge

## Purpose

Specification for **rejected knowledge** within the 20-knowledge-base domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/20-knowledge-base/candidate-knowledge.md -->

# candidate knowledge

## Purpose

Specification for **candidate knowledge** within the 20-knowledge-base domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/20-knowledge-base/discovered-knowledge.md -->

# discovered knowledge

## Purpose

Specification for **discovered knowledge** within the 20-knowledge-base domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/20-knowledge-base/pattern-knowledge.md -->

# pattern knowledge

## Purpose

Specification for **pattern knowledge** within the 20-knowledge-base domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/20-knowledge-base/signal-knowledge.md -->

# signal knowledge

## Purpose

Specification for **signal knowledge** within the 20-knowledge-base domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/20-knowledge-base/validated-knowledge.md -->

# validated knowledge

## Purpose

Specification for **validated knowledge** within the 20-knowledge-base domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/20-knowledge-base/failure-knowledge.md -->

# failure knowledge

## Purpose

Specification for **failure knowledge** within the 20-knowledge-base domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/20-knowledge-base/knowledge-architecture.md -->

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

