---
depends_on: ['DOC-CONTRACT-DATA-risk-decision']
id: DOC-PATH-18-RISK-ENGINE-RISK-ARCHITECTURE-MD
title: Risk Architecture
status: approved
version: 0.6
phase: 0
domain: 18-risk-engine
updated: 2026-09-04
---

# Risk Absolute Authority (BUG-TRD-P0-002)

```text
Prediction → Signal → Strategy → Risk → Execution
```

Risk returns `ALLOW | REDUCE | DENY | HALT`.

**AI must never override Risk.** Even 99% model confidence cannot force ALLOW past Risk.

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


## Domain Acceptance Criteria

```text
AC-RISK-01
Given model confidence=0.99 and daily_loss limit breached
When Risk.evaluate runs
Then decision must be DENY or HALT, never ALLOW forced by AI

AC-RISK-02
Given Risk service unavailable
When order path is requested
Then default is DENY/HALT (fail-safe)

AC-RISK-03
Given risk_decision_id missing on intent
When Execution.submit is called
Then submit is rejected
```


<!-- merged from docs/18-risk-engine/correlation-risk.md -->

# correlation risk

## Purpose

Specification for **correlation risk** within the 18-risk-engine domain.

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


<!-- merged from docs/18-risk-engine/exposure-control.md -->

# exposure control

## Purpose

Specification for **exposure control** within the 18-risk-engine domain.

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


<!-- merged from docs/18-risk-engine/correlated-risk-budgeting.md -->

# correlated risk budgeting

## Purpose

Specification for **correlated risk budgeting** within the 18-risk-engine domain.

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


<!-- merged from docs/18-risk-engine/volatility-risk.md -->

# volatility risk

## Purpose

Specification for **volatility risk** within the 18-risk-engine domain.

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


<!-- merged from docs/18-risk-engine/signal-risk.md -->

# signal risk

## Purpose

Specification for **signal risk** within the 18-risk-engine domain.

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


<!-- merged from docs/18-risk-engine/strategy-risk.md -->

# strategy risk

## Purpose

Specification for **strategy risk** within the 18-risk-engine domain.

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


<!-- merged from docs/18-risk-engine/position-sizing.md -->

# position sizing

## Purpose

Specification for **position sizing** within the 18-risk-engine domain.

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


<!-- merged from docs/18-risk-engine/execution-risk.md -->

# execution risk

## Purpose

Specification for **execution risk** within the 18-risk-engine domain.

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


<!-- merged from docs/18-risk-engine/drawdown-control.md -->

# drawdown control

## Purpose

Specification for **drawdown control** within the 18-risk-engine domain.

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


<!-- merged from docs/18-risk-engine/emergency-stop.md -->

# emergency stop

## Purpose

Specification for **emergency stop** within the 18-risk-engine domain.

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


<!-- merged from docs/18-risk-engine/risk-gates.md -->

# Risk Gates

## Data Quality Gate

```text
data_health < threshold  →  NO TRADE
```

## AI Health Gate

```text
model calibration degraded  →  disable model / DENY signals from it
```

## Discovery Health Gate

Thousands of unstable discoveries → **discovery circuit breaker**.

Gates are independent of AI confidence.

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


<!-- merged from docs/18-risk-engine/model-risk.md -->

# model risk

## Purpose

Specification for **model risk** within the 18-risk-engine domain.

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


<!-- merged from docs/18-risk-engine/causal-cluster-risk.md -->

# causal cluster risk

## Purpose

Specification for **causal cluster risk** within the 18-risk-engine domain.

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

