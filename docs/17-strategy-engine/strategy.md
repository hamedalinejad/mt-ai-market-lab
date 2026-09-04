---
id: DOC-STRAT-MERGED-001
title: strategy
status: reviewed
phase: 0
created: 2026-09-04
updated: 2026-09-04
depends_on: []
related: []
---
> **Note:** Domain narrative consolidated from multiple former files. Binding contracts remain under `docs/contracts/`. Sections marked TBD are not Phase-0 binding.


# strategy


<!-- merged from docs/17-strategy-engine/strategy-architecture.md -->

# Strategy Architecture

## Purpose

Strategy **must not** trade a Prediction directly.

Forbidden:

```text
Prediction: 70% UP  →  BUY
```

Required path:

```text
Prediction
  ↓
Signal
  ↓
Strategy
  ↓
Risk
  ↓
Execution
```

## Strategy Contents

```text
Context
+ Entry
+ Exit
+ Stop
+ Take Profit
+ Sizing (proposal only; Risk may veto/reduce)
+ Filters
+ Invalidation
+ Lifecycle
```

## Rules

- Prediction is input evidence, not an order.
- Signal is input to Strategy; Strategy produces **intent**, not broker submission.
- Risk Engine has veto after Strategy intent.
- Execution is the only layer that submits orders (paper or live).


<!-- merged from docs/17-strategy-engine/strategy-model.md -->

# strategy model

## Purpose

Specification for **strategy model** within the 17-strategy-engine domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/17-strategy-engine/strategy-lifecycle.md -->

# strategy lifecycle

## Purpose

Specification for **strategy lifecycle** within the 17-strategy-engine domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/17-strategy-engine/strategy-selection.md -->

# strategy selection

## Purpose

Specification for **strategy selection** within the 17-strategy-engine domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/17-strategy-engine/strategy-ranking.md -->

# strategy ranking

## Purpose

Specification for **strategy ranking** within the 17-strategy-engine domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/17-strategy-engine/strategy-composition.md -->

# strategy composition

## Purpose

Specification for **strategy composition** within the 17-strategy-engine domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/17-strategy-engine/strategy-generation.md -->

# strategy generation

## Purpose

Specification for **strategy generation** within the 17-strategy-engine domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/17-strategy-engine/strategy-discovery.md -->

# Strategy Discovery

## Multi-objective (not max return alone)

```text
high return
low drawdown
low complexity
low turnover
high stability
low sensitivity
good OOS
```

Pareto / constrained optimization under Validation and cost bundle.


<!-- merged from docs/17-strategy-engine/strategy-evolution.md -->

# strategy evolution

## Purpose

Specification for **strategy evolution** within the 17-strategy-engine domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/17-strategy-engine/strategy-decay.md -->

# Strategy Decay

```text
decay = f(performance deterioration over time)
```

Thresholds and window lengths are versioned policy parameters, not hard-coded magic numbers in engines.


<!-- merged from docs/17-strategy-engine/strategy-retirement.md -->

# Strategy Retirement

Metric-based triggers (examples):

```text
OOS degradation | drawdown | confidence decay
regime failure | execution failure
```


<!-- merged from docs/17-strategy-engine/strategy-versioning.md -->

# strategy versioning

## Purpose

Specification for **strategy versioning** within the 17-strategy-engine domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/17-strategy-engine/strategy-testing.md -->

# strategy testing

## Purpose

Specification for **strategy testing** within the 17-strategy-engine domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD

