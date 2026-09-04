---
id: DOC-PATH-16-SIGNAL-ENGINE-SIGNAL-TRACE-MD
title: Signal Trace
status: draft
version: 0.2
phase: 0
domain: 16-signal-engine
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-SIG-002, DOC-KNOW-001]
related: [DOC-PRED-001, DOC-RISK-001, DOC-LEARN-008]
---

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

