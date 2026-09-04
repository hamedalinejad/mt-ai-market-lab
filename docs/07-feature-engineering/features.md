---
id: DOC-FEAT-MERGED-001
title: features
status: reviewed
phase: 0
---
> **Note:** Domain narrative consolidated from multiple former files. Binding contracts remain under `docs/contracts/`. Sections marked TBD are not Phase-0 binding.


# features


<!-- merged from docs/07-feature-engineering/candle-features.md -->

# candle features

## Purpose

Specification for **candle features** within the 07-feature-engineering domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/07-feature-engineering/feature-snapshot.md -->

# Feature Snapshot

```text
feature_set @ timestamp
```

Must record which inputs (candle ids, versions, availability times) produced the vector used for a prediction/signal.


<!-- merged from docs/07-feature-engineering/label-generation.md -->

# Label Generation

## Examples

```text
future_return_1 / _5
future_high / future_low
max_drawdown (path)
MFE / MAE
direction
range
```

## Critical

Each label declares **when it becomes observable** (availability time). Labels that need future path must not leak into features at decision time.

## MFE / MAE

- **Maximum Favorable Excursion**
- **Maximum Adverse Excursion**

Required candidates for strategy discovery evaluation.


<!-- merged from docs/07-feature-engineering/interaction-features.md -->

# interaction features

## Purpose

Specification for **interaction features** within the 07-feature-engineering domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/07-feature-engineering/rolling-features.md -->

# rolling features

## Purpose

Specification for **rolling features** within the 07-feature-engineering domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/07-feature-engineering/feature-discovery.md -->

# feature discovery

## Purpose

Specification for **feature discovery** within the 07-feature-engineering domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/07-feature-engineering/lag-features.md -->

# lag features

## Purpose

Specification for **lag features** within the 07-feature-engineering domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/07-feature-engineering/feature-redundancy.md -->

# feature redundancy

## Purpose

Specification for **feature redundancy** within the 07-feature-engineering domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/07-feature-engineering/volatility-features.md -->

# volatility features

## Purpose

Specification for **volatility features** within the 07-feature-engineering domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/07-feature-engineering/cross-timeframe-features.md -->

# Cross-Timeframe Features

## Leakage control

An M1 decision must not use an **incomplete** higher-TF bar as if it were closed H1/D1 future knowledge.

Only last **closed** higher-TF bars (or explicitly declared partial-bar semantics) are allowed.


<!-- merged from docs/07-feature-engineering/statistical-features.md -->

# statistical features

## Purpose

Specification for **statistical features** within the 07-feature-engineering domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/07-feature-engineering/feature-architecture.md -->

# Feature Architecture

Binding contracts: `docs/contracts/data/feature.md`, `feature-snapshot.md`, `label.md`.

## Regenerability
| Mode | Meaning |
|------|---------|
| persisted | written to feature store / parquet |
| cached | ephemeral speed layer |
| on_demand | compute at read from canonical + definition_version |

Changing definition_version invalidates prior snapshots for that id.


<!-- merged from docs/07-feature-engineering/return-features.md -->

# return features

## Purpose

Specification for **return features** within the 07-feature-engineering domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/07-feature-engineering/raw-features.md -->

# raw features

## Purpose

Specification for **raw features** within the 07-feature-engineering domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/07-feature-engineering/temporal-features.md -->

# temporal features

## Purpose

Specification for **temporal features** within the 07-feature-engineering domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/07-feature-engineering/structural-features.md -->

# structural features

## Purpose

Specification for **structural features** within the 07-feature-engineering domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/07-feature-engineering/feature-selection.md -->

# Feature Selection

## Redundancy before heavy training

```text
correlation | mutual information | stability | importance | redundancy
```

## Time-aware selection (mandatory)

Forbidden:

```text
full dataset → feature selection → train/test
```

Required: selection **inside each training window** (nested), never using future test folds.


<!-- merged from docs/07-feature-engineering/feature-validation.md -->

# feature validation

## Purpose

Specification for **feature validation** within the 07-feature-engineering domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/07-feature-engineering/price-features.md -->

# price features

## Purpose

Specification for **price features** within the 07-feature-engineering domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD

