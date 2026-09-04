---
id: DOC-MERGED
title: resources
status: reviewed
phase: 0
---

# resources


<!-- merged from docs/22-resource-management/scheduling.md -->

# scheduling

## Purpose

Specification for **scheduling** within the 22-resource-management domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/22-resource-management/cpu-budget.md -->

# cpu budget

## Purpose

Specification for **cpu budget** within the 22-resource-management domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/22-resource-management/adaptive-resource-control.md -->

# Adaptive Resource Control

## Purpose

Adapt workload to measured resources.

## Control Loop

```text
Measure → Budget → Prioritize → Throttle → Degrade Gracefully
```

## Profiles

```text
Laptop Mode
Standard Mode
High Performance Mode
Research Mode
Emergency Low Resource Mode
```

## Shed Order (example under low RAM)

```text
Discovery ↓
Training ↓
Feature cache ↓
Parallelism ↓
Live analysis stays ON
```

Priority reminder (from Master Blueprint):

```text
P0 Data Integrity
P1 MT5 Connection
P2 Live Analysis
P3 Signal / Prediction
P4 Online Learning
P5 Validation
P6 Discovery
P7 Deep Research
```

## Rules

- Emergency mode is automatic, auditable, and reversible when resources recover.
- Research Mode must not share process with Live (see Runtime Modes).


<!-- merged from docs/22-resource-management/workload-priority.md -->

# workload priority

## Purpose

Specification for **workload priority** within the 22-resource-management domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/22-resource-management/storage-budget.md -->

# storage budget

## Purpose

Specification for **storage budget** within the 22-resource-management domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/22-resource-management/gpu-policy.md -->

# gpu policy

## Purpose

Specification for **gpu policy** within the 22-resource-management domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/22-resource-management/resource-architecture.md -->

# resource architecture

## Purpose

Specification for **resource architecture** within the 22-resource-management domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/22-resource-management/hardware-profiles.md -->

# Laptop Resource Budgets (structure)

```text
RAM hard limit
CPU target
GPU optional
live latency target
training time target
discovery time budget
storage growth rate
concurrency limit
```

Numeric values filled after Benchmark; structure mandatory before code.


<!-- merged from docs/22-resource-management/memory-budget.md -->

# memory budget

## Purpose

Specification for **memory budget** within the 22-resource-management domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/22-resource-management/budget-semantics.md -->

# Target vs Budget vs Hard Limit (B-007/B-008/B-017)

| Term | Meaning |
|------|---------|
| **Target** | Desired operating point (soft) |
| **Budget** | Allocated share under a hardware profile |
| **Hard limit** | Must not exceed; trip Safe/Degraded |

Numeric RAM/CPU/storage figures remain **Candidate Benchmark Targets** until measured workload definitions exist. Symbol universe is configurable; capacity is benchmarked separately from product marketing targets.


<!-- merged from docs/22-resource-management/graceful-degradation.md -->

# Graceful Degradation

## Purpose

When resources breach budget, shed work in priority order without killing data integrity or live monitoring.

## Shed Order (example)

```text
Discovery ↓
Training ↓
Feature cache ↓
Parallelism ↓
Live analysis stays ON
```

## Preserve

- P0 Data Integrity
- P1 MT5 Connection
- P2 Live Analysis

## Rules

- Degradation is automatic, observable, and reversible.
- Never drop integrity checks to “save RAM.”

