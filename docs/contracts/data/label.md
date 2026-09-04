---
id: DOC-CONTRACT-DATA-label
title: Data Contract — Label
status: reviewed
version: 0.8
phase: 0
domain: contracts
updated: 2026-09-04
---

# Label Definition (BUG-AI-P0-003)

```text
label_id
version
decision_time          # decision_point binding
horizon
target_definition      # exact formula
price_definition       # which prices enter the formula
cost_adjustment        # optional costs in target
overlap_policy
availability_rule      # when label becomes observable
```

Example: `next_candle_return_h1` must state from-price → to-price (e.g. close→close of next H1 **closed** bar), timezone, and availability_rule.

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

