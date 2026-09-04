---
id: DOC-MERGED
title: prediction
status: reviewed
phase: 0
---

# prediction


<!-- merged from docs/12-prediction/probability-estimation.md -->

# probability estimation

## Purpose

Specification for **probability estimation** within the 12-prediction domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/12-prediction/price-prediction.md -->

# price prediction

## Purpose

Specification for **price prediction** within the 12-prediction domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/12-prediction/multi-timeframe-prediction.md -->

# multi timeframe prediction

## Purpose

Specification for **multi timeframe prediction** within the 12-prediction domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/12-prediction/multi-candle-prediction.md -->

# multi candle prediction

## Purpose

Specification for **multi candle prediction** within the 12-prediction domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/12-prediction/confidence-estimation.md -->

# confidence estimation

## Purpose

Specification for **confidence estimation** within the 12-prediction domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/12-prediction/return-prediction.md -->

# return prediction

## Purpose

Specification for **return prediction** within the 12-prediction domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/12-prediction/direction-prediction.md -->

# Direction Prediction

## Preferred form

```text
P(up), P(down), P(flat)
```

not only a hard class label.

## Rules

- Hard label, if emitted, is a thresholded summary of probabilities.
- Calibration and confidence are part of evaluation, not optional extras.


<!-- merged from docs/12-prediction/volatility-prediction.md -->

# volatility prediction

## Purpose

Specification for **volatility prediction** within the 12-prediction domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/12-prediction/scenario-prediction.md -->

# scenario prediction

## Purpose

Specification for **scenario prediction** within the 12-prediction domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/12-prediction/prediction-evaluation.md -->

# prediction evaluation

## Purpose

Specification for **prediction evaluation** within the 12-prediction domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/12-prediction/range-prediction.md -->

# range prediction

## Purpose

Specification for **range prediction** within the 12-prediction domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/12-prediction/uncertainty-estimation.md -->

# uncertainty estimation

## Purpose

Specification for **uncertainty estimation** within the 12-prediction domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/12-prediction/next-candle-prediction.md -->

# Next Candle Prediction

## Purpose

Predict properties of the **next candle** as a multi-output probabilistic object — not a single label `bullish`.

## Required / Preferred Outputs

```text
P(Close > Open)
P(Close > previous_close)
Expected return
Expected range
Expected volatility
Expected high
Expected low
```

Optional:

- quantiles for high/low/close/return  
- scenarios (paths) with probabilities  
- uncertainty intervals  

## Forbidden as sole output

```text
next_candle = bullish
```

A hard direction label may exist only as a **summary** of an underlying probability vector, with thresholds declared and calibrated.

## Rules

- Decision point (bar open vs close) must be declared.
- Outputs are estimates for Signal Engine consumption, not orders.


<!-- merged from docs/12-prediction/prediction-architecture.md -->

# Prediction Architecture

Prediction is source-agnostic: features + model version in, probabilistic outputs + evidence out. No direct data-source coupling.

