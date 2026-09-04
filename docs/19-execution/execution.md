---
id: DOC-EXEC-MERGED-001
title: execution
status: reviewed
phase: 0
---
> **Note:** Domain narrative consolidated from multiple former files. Binding contracts remain under `docs/contracts/`. Sections marked TBD are not Phase-0 binding.


# execution


<!-- merged from docs/19-execution/order-validation.md -->

# order validation

## Purpose

Specification for **order validation** within the 19-execution domain.

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


<!-- merged from docs/19-execution/account-state.md -->

# Account State

Track and reconcile: balance, equity, margin, free margin, positions, pending orders — paper books and live MT5 state.

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


<!-- merged from docs/19-execution/paper-trading.md -->

# Paper Trading

## Purpose

Paper Trading must mirror Live, except broker submission.

## Same as Live

```text
Signal
Strategy
Risk
Execution
Reconciliation
Cost
Slippage
Spread
Latency (modeled)
```

## Difference

```text
Broker Execution  →  Simulated Execution
```

## Rules

- Not a toy simulator that bypasses Risk or Trace.
- Uses real market data path.
- Simulated fills consume the **dynamic slippage model**.
- Outcomes feed Error Memory and performance the same way as live (flagged `paper`).

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


<!-- merged from docs/19-execution/execution-architecture.md -->

# Execution P0

## Path
Intent → Risk → submit (paper/live) → reconcile

## Idempotency keys
intent_id, client_order_id, broker_ticket

## Reconciliation
Local vs broker: orders, positions, deals, account state.

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


<!-- merged from docs/19-execution/execution-boundary.md -->

# Execution Boundary

## Allows

- Paper execution
- Controlled live execution (later phases)
- Order validation
- Execution reconciliation

## Forbids

- Direct Prediction → Order
- Direct Discovery → Order
- Strategy bypass of Risk
- Blind resend of orders without reconcile

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


<!-- merged from docs/19-execution/exit-model.md -->

# exit model

## Purpose

Specification for **exit model** within the 19-execution domain.

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


<!-- merged from docs/19-execution/take-profit-model.md -->

# take profit model

## Purpose

Specification for **take profit model** within the 19-execution domain.

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


<!-- merged from docs/19-execution/stop-loss-model.md -->

# stop loss model

## Purpose

Specification for **stop loss model** within the 19-execution domain.

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


<!-- merged from docs/19-execution/entry-model.md -->

# entry model

## Purpose

Specification for **entry model** within the 19-execution domain.

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


<!-- merged from docs/19-execution/live-trading.md -->

# live trading

## Purpose

Specification for **live trading** within the 19-execution domain.

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


<!-- merged from docs/19-execution/reconciliation.md -->

# Execution Reconciliation

## Purpose

**P0 after every execution attempt** (paper or live). Network loss after `order_send()` must not create duplicate trades.

## Reconcile Path

```text
Local Intent
      ↓
MT5 Order
      ↓
Broker Result
      ↓
Positions
      ↓
Deals
      ↓
Local State
```

## MT5 API surfaces (reference)

- `order_send`
- `orders_get`
- `positions_get`
- `history_orders_get`
- `history_deals_get`

## Required identifiers

```text
intent_id
client_order_id
broker_ticket
execution_state
```

## Required behavior on uncertainty

```text
timeout / disconnect
       ↓
reconcile against orders / positions / deals
       ↓
if intent not accepted → may send once under same client_order_id policy
if intent accepted → bind ticket; do not create a second order
```

## Rules

- Idempotent execution is mandatory.
- Paper mode reconciles against the **simulator books** with the same state machine.

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


<!-- merged from docs/19-execution/order-model.md -->

# Order Model

## Purpose

Idempotent order intent for paper and live.

## Required identifiers

```text
intent_id
client_order_id
broker_ticket          # when known
execution_state
```

## Execution states (logical)

```text
INTENT_CREATED
VALIDATED
SENT
ACCEPTED
REJECTED
PARTIAL
FILLED
CANCELLED
UNKNOWN_NEEDS_RECONCILE
RECONCILED
```

## Rules

- On `UNKNOWN_NEEDS_RECONCILE`, forbid blind resend.
- Bind `broker_ticket` from positions/orders/deals during reconciliation.

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


<!-- merged from docs/19-execution/kill-switch.md -->

# kill switch

## Purpose

Specification for **kill switch** within the 19-execution domain.

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


<!-- merged from docs/19-execution/execution-policy.md -->

# execution policy

## Purpose

Specification for **execution policy** within the 19-execution domain.

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


<!-- merged from docs/19-execution/slippage-handling.md -->

# Slippage Handling

## Purpose

Slippage is **dynamic**, not a fixed `1 pip`.

## Forbidden as sole model

```text
slippage = 1 pip
```

## Dynamic model inputs (candidate)

```text
spread
volatility
liquidity
session
symbol
order size
market regime
latency
```

## Rules

- Paper and Live validation use the same slippage model family.
- Stress tests use adverse percentiles of the model, not only the mean.
- Model parameters are calibrated offline and versioned; live uses promoted version only.

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


<!-- merged from docs/19-execution/order-rejection-requote.md -->

# Rejection / Requote / Partial Fill

Execution state machine must handle reject, requote, partial fill, timeout→reconcile. No blind resend without idempotent intent.

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

