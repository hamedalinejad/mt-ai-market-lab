---
id: DOC-PROJ-010
title: Phase 0 Coverage Matrix (Gaps Checklist)
status: draft
version: 0.2
phase: 0
domain: 00-project
created: 2026-09-02
updated: 2026-09-02
depends_on: [DOC-MASTER-001]
---

# Phase 0 Coverage Matrix

Items listed by the architecture review. Status: **Spec exists** (narrative) vs **Contract pending** (schema/interface before code).

## Data

| Item | Spec | Notes |
|------|------|-------|
| Tick ID | Spec | tick-model + dedupe keys |
| Quote semantics | Spec | quote-semantics.md |
| Bid/Ask consistency | Spec | quote-semantics.md |
| Tick flags | Spec | tick-model |
| Tick deduplication | Spec | duplicate-prevention |
| Tick ordering | Spec | tick-model |
| Candle reconstruction | Spec | timeframe + bar-ingestion |
| Candle close semantics | Spec | candle-close-semantics |
| Session boundaries | Spec | market-sessions |
| DST | Spec | timezone-policy / broker-time |
| Broker calendar | Spec | market-calendar |
| Market holidays | Spec | gap-classification |
| Data revisions | Spec | leakage / provenance |
| Source precedence | Spec | source-precedence.md |
| Data quarantine | Spec | quarantine-layer |

## AI

| Item | Spec |
|------|------|
| Label architecture | label-generation |
| Dataset snapshots | dataset-snapshot |
| Model artifacts | model-versioning |
| Feature versioning | feature-architecture |
| Calibration | confidence-calibration |
| Drift detection | drift-detection.md |
| Concept drift | drift-detection.md |
| Catastrophic forgetting | learning-loop (replay) |
| Replay buffer | learning-loop |
| Shadow model | online-learning |
| Champion/challenger | model-lifecycle |
| Rollback | model-lifecycle / registry |

## Discovery

| Item | Spec |
|------|------|
| Search / operator grammar | discovery-space |
| Expression tree | symbolic-regression / formula-discovery |
| Complexity control | search-strategy / discovery_score |
| Novelty | novelty-detection |
| Equivalence detection | search-strategy |
| Multiple testing | multiple-testing-control |
| Search budget | search-strategy |
| Candidate deduplication | discovery-memory / novelty |
| Pareto frontier | hypothesis-ranking |
| Discovery lineage | knowledge graph / discovery-memory |

## Validation

| Item | Spec |
|------|------|
| Nested walk-forward | walk-forward + anti-overfitting |
| Embargo / purging | leakage-prevention + label-generation |
| Event-driven replay | backtesting + replay-engine |
| Monte Carlo / bootstrap | validation-architecture |
| Reality check / robustness / stress | adversarial + metrics |
| Regime transfer | regime + validation |
| Cross-symbol validation | cross-market + leakage |

## Trading

| Item | Spec |
|------|------|
| Spread / commission / swap / slippage | transaction-costs + slippage-handling |
| Latency / partial fills / rejection / requote | execution + order-model |
| Order / position reconciliation | execution reconciliation |
| Account state | account-state.md |
| Kill switch | kill-switch.md |

## Operations

| Item | Spec |
|------|------|
| Startup / shutdown / crash recovery | ops startup/shutdown |
| Disk-full / DB recovery | retry-policy + corruption-recovery |
| MT5 reconnect | reconnect docs |
| Corrupted dataset recovery | corruption-recovery |
| Model rollback | model-lifecycle |
| Safe mode | safe-mode |
| Health checks / watchdog | health-watchdog.md |
