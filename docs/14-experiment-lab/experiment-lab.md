---
id: DOC-EXPL-MERGED-001
title: experiment-lab
status: reviewed
phase: 0
created: 2026-09-04
updated: 2026-09-04
depends_on: []
related: []
---
> **Note:** Domain narrative consolidated from multiple former files. Binding contracts remain under `docs/contracts/`. Sections marked TBD are not Phase-0 binding.


# experiment-lab


<!-- merged from docs/14-experiment-lab/experiment-architecture.md -->

# experiment architecture

## Purpose

Specification for **experiment architecture** within the 14-experiment-lab domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/14-experiment-lab/experiment-model.md -->

# Experiment Run (binding IDs)

Every run records:

```text
experiment_id
hypothesis_id
dataset_snapshot_id
feature_set_id
model_id
config_version
code_version
seed
hardware_profile
cost_bundle_id
status
started_at / finished_at
```

## Failures
`status=failed` experiments are **retained** (never deleted). Outcomes and error payloads stay in registry for learning and audit.


<!-- merged from docs/14-experiment-lab/experiment-lifecycle.md -->

# experiment lifecycle

## Purpose

Specification for **experiment lifecycle** within the 14-experiment-lab domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/14-experiment-lab/experiment-registry.md -->

# Experiment Registry

```text
Experiment ID | Hypothesis | Dataset | Method | Result | Conclusion
```


<!-- merged from docs/14-experiment-lab/experiment-comparison.md -->

# experiment comparison

## Purpose

Specification for **experiment comparison** within the 14-experiment-lab domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/14-experiment-lab/hypothesis-model.md -->

# hypothesis model

## Purpose

Specification for **hypothesis model** within the 14-experiment-lab domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/14-experiment-lab/hypothesis-registry.md -->

# Hypothesis Registry

```text
H-00001
status: open | testing | supported | rejected | superseded
```


<!-- merged from docs/14-experiment-lab/reproducibility.md -->

# Reproducibility

Same pins must replay the experiment:

```text
dataset_snapshot_id + code_version + config_version + seed
(+ feature_set_id / model_id when applicable)
```

Missing pins ⇒ non-comparable / non-promotable.


<!-- merged from docs/14-experiment-lab/result-recording.md -->

# result recording

## Purpose

Specification for **result recording** within the 14-experiment-lab domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/14-experiment-lab/research-tracking.md -->

# research tracking

## Purpose

Specification for **research tracking** within the 14-experiment-lab domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/14-experiment-lab/candidate-management.md -->

# candidate management

## Purpose

Specification for **candidate management** within the 14-experiment-lab domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/14-experiment-lab/dataset-snapshot.md -->

# Dataset Snapshot

```text
dataset-2026-09-01-0001
```

Immutable snapshot so later data fixes do not rewrite history of old experiments.


<!-- merged from docs/14-experiment-lab/failed-experiment-memory.md -->

# Failed Experiments

Failed runs are first-class registry rows. No purge-for-convenience. Used as negative evidence and debugging trail.


<!-- merged from docs/14-experiment-lab/cost-bundle.md -->

# Versioned Cost Bundle (BUG-VAL-P0-005)

Independent artifact `cost_bundle_id` / version includes:

```text
spread model
commission
swap
slippage
latency
partial fill assumptions
rejection / requote assumptions
```

Experiments and backtests **pin** cost_bundle_id; results without pin are non-comparable.

