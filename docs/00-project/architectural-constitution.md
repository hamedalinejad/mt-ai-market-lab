---
id: DOC-PROJ-052
title: Architectural Constitution
status: approved
version: 1.0
phase: 0
domain: 00-project
created: 2026-09-04
updated: 2026-09-04
depends_on: ['DOC-PROJ-050', 'DOC-PROJ-051']
related: ['DOC-CONV-013']
---

# Architectural Constitution (binding)

| Rule | Statement |
|------|-----------|
| **A — Data First** | No prediction, discovery, or trading decision may use data whose integrity state is unknown. |
| **B — Time Is First-Class** | Every market observation, feature, label, decision and execution event must have explicit temporal semantics. |
| **C — Availability-Time Safety** | A value is usable for a decision only when it was actually available to the system at that decision point. |
| **D — Discovery ≠ Truth** | Discovery produces a **candidate claim**, not automatic knowledge. |
| **E — Prediction ≠ Decision** | Models estimate; signal/strategy proposes action candidates; **Risk** decides permission. |
| **F — Risk Absolute Authority** | Risk returns `ALLOW \| REDUCE \| DENY \| HALT`. No AI, strategy, or execution adapter may override **DENY** or **HALT**. |
| **G — Learning Is Reversible** | Every promoted model/params has predecessor, dataset snapshot, feature definition, validation evidence, rollback path. |
| **H — Reproducibility Before Optimization** | A fast experiment that cannot be deterministically replayed is **not promotable**. |
| **I — Resource Awareness** | Under laptop constraint: research/discovery yield first; data integrity and active monitoring yield last. |
| **J — No Hidden Side Effects** | Pure analysis must not silently write trading state. Execution must not silently alter models or knowledge. |

These rules outrank strategy/AI preference (see invariant precedence).
