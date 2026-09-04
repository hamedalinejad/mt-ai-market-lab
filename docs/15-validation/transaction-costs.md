---
id: DOC-VAL-021
title: Transaction Costs
status: draft
version: 0.2
phase: 0
domain: 15-validation
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-VAL-022, DOC-EXPL-003]
related: [DOC-EXEC-010, DOC-VAL-019, DOC-VAL-020]
---

# Transaction Costs

## Purpose

Every backtest, experiment, and paper evaluation **must** bind explicit cost assumptions. Results without cost model versions are **not comparable**.

## Required Cost Bundle (versioned)

```text
spread_model_version
slippage_model_version
commission_model
swap_model
execution_assumptions
latency_assumptions
```

## Binding

Each **Dataset** used for economic evaluation and each **Experiment** run records the full cost bundle id/version in its manifest.

```text
dataset_manifest.cost_bundle_id
experiment_run.cost_bundle_id
```

Changing any component requires a **new cost_bundle version**; prior results remain tied to the old bundle.

## Rules

- No promotional claim from a backtest missing cost bundle metadata.
- Paper and Live evaluation report realized costs against the same model family where applicable.
- Slippage is dynamic (see execution slippage handling), not a fixed constant alone.

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

