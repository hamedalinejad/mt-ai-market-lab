---
id: DOC-MERGED
title: modes
status: reviewed
phase: 0
---

# modes


<!-- merged from docs/21-runtime-modes/paper-trading-mode.md -->

# paper trading mode

## Purpose

Specification for **paper trading mode** within the 21-runtime-modes domain.

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


<!-- merged from docs/21-runtime-modes/priority-policy.md -->

# priority policy

## Purpose

Specification for **priority policy** within the 21-runtime-modes domain.

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


<!-- merged from docs/21-runtime-modes/live-vs-research.md -->

# Live vs Research

## Live

real-time analysis, light learning, prediction, signal, monitoring

## Training / Research

historical training, discovery, deep search, validation, model generation, strategy discovery

Separate processes; Promotion is the bridge.

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


<!-- merged from docs/21-runtime-modes/validation-mode.md -->

# validation mode

## Purpose

Specification for **validation mode** within the 21-runtime-modes domain.

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


<!-- merged from docs/21-runtime-modes/training-mode.md -->

# Training Mode

## Process

Runs in the **TRAINING PROCESS** (separate from Live by default):

```text
Dataset → Training → Discovery (optional) → Validation → Model Candidate
```

## Promotion

```text
Candidate → Validation → Promotion → Live Model
```

## Rules

- Must not share process with Live under default Laptop/Standard profiles.
- May use Research / High Performance resource profile.

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


<!-- merged from docs/21-runtime-modes/research-mode.md -->

# research mode

## Purpose

Specification for **research mode** within the 21-runtime-modes domain.

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


<!-- merged from docs/21-runtime-modes/mode-switching.md -->

# mode switching

## Purpose

Specification for **mode switching** within the 21-runtime-modes domain.

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


<!-- merged from docs/21-runtime-modes/offline-research-mode.md -->

# Offline Research Mode

Fully independent of live MT5: uses **Dataset Snapshots** only. No trading, no live signals.

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


<!-- merged from docs/21-runtime-modes/live-trading-mode.md -->

# live trading mode

## Purpose

Specification for **live trading mode** within the 21-runtime-modes domain.

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


<!-- merged from docs/21-runtime-modes/mode-architecture.md -->

# Runtime Modes (minimum)

```text
OFFLINE_RESEARCH
TRAINING
VALIDATION
PAPER
LIVE_ANALYSIS
LIVE_TRADING
SAFE_MODE
```

Each mode defines: allowed components, forbidden components, resource budget, state transitions, exit conditions.

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


<!-- merged from docs/21-runtime-modes/live-analysis-mode.md -->

# Live Analysis Mode

## Process

Runs in the **LIVE PROCESS**:

```text
MT5 → Data Collector → Feature Engine → Inference → Signal (+ light shadow learning)
```

## Includes

- MT5 connection, sync, live data
- Analysis, prediction, signal
- Light online learning **only** via shadow + governance
- Monitoring

## Excludes

- Heavy training
- Full Discovery search
- Adversarial campaigns that starve live resources

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

