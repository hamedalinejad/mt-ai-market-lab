---
id: DOC-LEARN-MERGED-001
title: learning
status: reviewed
phase: 0
created: 2026-09-04
updated: 2026-09-04
depends_on: []
related: []
---
> **Note:** Domain narrative consolidated from multiple former files. Binding contracts remain under `docs/contracts/`. Sections marked TBD are not Phase-0 binding.


# learning


<!-- merged from docs/11-learning-and-self-correction/failed-strategy-memory.md -->

# failed strategy memory

## Purpose

Specification for **failed strategy memory** within the 11-learning-and-self-correction domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/11-learning-and-self-correction/mistake-analysis.md -->

# mistake analysis

## Purpose

Specification for **mistake analysis** within the 11-learning-and-self-correction domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/11-learning-and-self-correction/learning-safety.md -->

# Learning Safety

## Purpose

Bound learning so mistakes correct the system **through governance**, not through erasure or blind updates.

## Forbidden

```text
new candle → model.update() → production
```

```text
mistake → delete the mistake from history
```

## Required

```text
Observation → Prediction → Outcome → Evaluation
  → Error Classification → Candidate Update
  → Shadow Model → Validation → Promotion / Rollback
```

```text
Failure → Failure Memory → Training Signal / Negative Evidence
```

## Rules

- Production weights change only via Promotion.
- Shadow models absorb candidate online updates.
- Failure Memory is mandatory evidence, not disposable log noise.


<!-- merged from docs/11-learning-and-self-correction/belief-updating.md -->

# belief updating

## Purpose

Specification for **belief updating** within the 11-learning-and-self-correction domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/11-learning-and-self-correction/confidence-updating.md -->

# confidence updating

## Purpose

Specification for **confidence updating** within the 11-learning-and-self-correction domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/11-learning-and-self-correction/model-reweighting.md -->

# model reweighting

## Purpose

Specification for **model reweighting** within the 11-learning-and-self-correction domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/11-learning-and-self-correction/error-classification.md -->

# error classification

## Purpose

Specification for **error classification** within the 11-learning-and-self-correction domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/11-learning-and-self-correction/error-model.md -->

# error model

## Purpose

Specification for **error model** within the 11-learning-and-self-correction domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/11-learning-and-self-correction/knowledge-revision.md -->

# knowledge revision

## Purpose

Specification for **knowledge revision** within the 11-learning-and-self-correction domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/11-learning-and-self-correction/failed-pattern-memory.md -->

# failed pattern memory

## Purpose

Specification for **failed pattern memory** within the 11-learning-and-self-correction domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/11-learning-and-self-correction/learning-loop.md -->

# Learning Loop

## Anti-oscillation controls

```text
update threshold
minimum evidence
cooldown
rollback threshold
stability window
```

Blind `error → update → error → update` loops are forbidden.

## Continual learning with replay

```text
Recent Data
+ Representative Historical Data
+ Failure Cases
+ Rare Events
+ Regime Samples
```

Mitigates catastrophic forgetting.

## Failure memory weighting

Failures are not equal:

```text
normal miss | rare-event miss | regime-change miss
execution miss | data-quality miss | model-confidence miss
```


<!-- merged from docs/11-learning-and-self-correction/failed-signal-memory.md -->

# failed signal memory

## Purpose

Specification for **failed signal memory** within the 11-learning-and-self-correction domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/11-learning-and-self-correction/failure-memory.md -->

# ML-specific Error Taxonomy (BUG-AI-P0-006)

```text
data_error
label_error
feature_error
distribution_shift
concept_drift
model_error
execution_error
risk_block
signal_error
strategy_error
unknown
```

Failures retained; weighted by type for replay/learning.


<!-- merged from docs/11-learning-and-self-correction/outcome-feedback.md -->

# outcome feedback

## Purpose

Specification for **outcome feedback** within the 11-learning-and-self-correction domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD

