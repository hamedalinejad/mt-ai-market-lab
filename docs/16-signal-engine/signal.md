---
id: DOC-SIG-MERGED-001
title: signal
status: reviewed
phase: 0
---
> **Note:** Domain narrative consolidated from multiple former files. Binding contracts remain under `docs/contracts/`. Sections marked TBD are not Phase-0 binding.


# signal


<!-- merged from docs/16-signal-engine/signal-confidence.md -->

# Signal Confidence

```text
raw_model_score → calibrated_probability → decision_score
```

Signal confidence is calibrated and evidence-aware, not a raw model dump.

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


<!-- merged from docs/16-signal-engine/signal-history.md -->

# signal history

## Purpose

Specification for **signal history** within the 16-signal-engine domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD

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


<!-- merged from docs/16-signal-engine/signal-model.md -->

# Signal Model

## Purpose

Signal is an independent entity with lifecycle and trace.

## Core Fields

```text
Symbol / instrument_id
Timeframe
Direction
Horizon
Strength
Confidence
Prediction References
Evidence
Supporting Knowledge
Contradicting Knowledge
Expiration
Status
Trace
```

## Lifecycle

```text
CREATED
  ↓
CONFIRMED
  ↓
ACTIVE
  ↓
UPDATED
  ↓
EXPIRED
  ↓
RESOLVED
```

If wrong:

```text
FAILED
```

## Rules

- **FAILED signals are not deleted.** They are recorded and linked to Failure Memory and outcome evaluation.
- EXPIRED / RESOLVED remain in history for learning and audit.
- Status transitions are explicit and timestamped.

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


<!-- merged from docs/16-signal-engine/signal-ranking.md -->

# signal ranking

## Purpose

Specification for **signal ranking** within the 16-signal-engine domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD

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


<!-- merged from docs/16-signal-engine/false-signal-analysis.md -->

# false signal analysis

## Purpose

Specification for **false signal analysis** within the 16-signal-engine domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD

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


<!-- merged from docs/16-signal-engine/signal-vs-strategy.md -->

# Signal ≠ Strategy (BUG-TRD-P0-001)

| Layer | Meaning |
|-------|---------|
| **Signal** | What was observed / inferred and with what confidence |
| **Strategy** | What action policy is proposed given signals + context |

Must not merge into one object. Strategy consumes signals; signals do not embed order instructions.

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


<!-- merged from docs/16-signal-engine/signal-deduplication.md -->

# Signal Deduplication

Fingerprint (example):

```text
symbol | timeframe | direction | strategy | source | generation window
```

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


<!-- merged from docs/16-signal-engine/signal-expiration.md -->

# Signal Expiration

Expiration is **market-aware**, not a fixed 10 minutes for all:

```text
timeframe | signal type | regime | event | strategy
```

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


<!-- merged from docs/16-signal-engine/signal-generation.md -->

# signal generation

## Purpose

Specification for **signal generation** within the 16-signal-engine domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD

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


<!-- merged from docs/16-signal-engine/signal-confirmation.md -->

# signal confirmation

## Purpose

Specification for **signal confirmation** within the 16-signal-engine domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD

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


<!-- merged from docs/16-signal-engine/signal-trace.md -->

# Signal Trace

## Purpose

End-to-end answer to **why** this signal exists.

## Required Trace Fields (material signals)

```text
Symbol / instrument_id
Timeframe
Timestamp
Candle IDs
Features (feature_set_id + version + snapshot)
Indicators
Pattern refs
Model + Model Version
Prediction + Confidence / probabilities
Discovery refs (if any)
Knowledge refs
Strategy ref
Risk Decision (ALLOW/DENY/REDUCE/…)
```

Plus:

```text
Data Snapshot
Market State
Contradictions
Error Memory Matches
Confidence Decomposition
Decision Path
```

## Rules

- Material Signal without Trace is non-compliant.
- FAILED signals retain Trace; they are not deleted.
- Trace links into the Knowledge graph (typed edges).

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


<!-- merged from docs/16-signal-engine/signal-strength.md -->

# signal strength

## Purpose

Specification for **signal strength** within the 16-signal-engine domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD

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


<!-- merged from docs/16-signal-engine/signal-confluence.md -->

# signal confluence

## Purpose

Specification for **signal confluence** within the 16-signal-engine domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD

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


<!-- merged from docs/16-signal-engine/signal-architecture.md -->

# Signal Architecture

## Purpose

Keep **Signal** independent from **Prediction**.

```text
Prediction ≠ Decision
```

## Assembly Path

```text
Prediction
+
Analysis
+
Discovery
+
Context
+
Knowledge
       ↓
Signal Candidate
       ↓
Signal Validation
       ↓
Signal Confidence
       ↓
Signal
```

## Rules

- A Prediction alone does not create a production Signal.
- Evidence, knowledge refs, and Trace are mandatory for material signals.
- Risk Engine may veto after Signal creation; Execution remains further downstream.

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

