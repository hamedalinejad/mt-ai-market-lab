# mt-ai-market-lab

> **Adaptive Market Intelligence, Cross-Market Discovery, Prediction & Automated Trading Laboratory**

**Document Status:** Phase 0 — Documentation First  
**Version:** 1.0.0  
**Date:** 2026-09-01  
**Implementation Status:** No production code  
**Trading Status:** Disabled

---

## Overview

`mt-ai-market-lab` is **not** a simple trading bot.

It is designed as an adaptive laboratory for market intelligence that:

- Starts from market data (MetaTrader 5 + external sources)
- Builds representations and intelligence
- Separates **Prediction** from **Discovery**
- Treats every Discovery as a **Candidate** only
- Subjects candidates to Experiment Lab and Validation (including Adversarial)
- Maintains a Knowledge Lifecycle
- Produces Traceable Signals
- Separates Strategy from Risk
- Enables Execution only under controlled Risk & Safety gates

## Core Principles

- Documentation First
- Data First
- Discovery ≠ Truth
- Prediction ≠ Decision
- Learning ≠ Blind Update
- Correlation ≠ Causation
- Validation Before Promotion
- Reversible Intelligence
- Explainability by Trace
- Lightweight First
- Separation of Concerns
- Controlled Automation

## Current Phase

**Phase 0 — Documentation First**

No production code is written until corresponding Specifications are approved.

See the full Master Blueprint and domain specifications under [`docs/`](docs/).

## Repository Structure

```
mt-ai-market-lab/
├── README.md
├── CHANGELOG.md
├── CONTRIBUTING.md
├── LICENSE
├── .gitignore
├── .gitattributes
└── docs/
    ├── README.md
    ├── INDEX.md
    ├── REGISTRY.md
    ├── GLOSSARY.md
    ├── CHANGELOG.md
    ├── conventions/
    ├── decisions/          # ADRs
    ├── 00-project/
    ├── 01-system-architecture/
    ├── 02-metatrader/
    ├── 03-market-data/
    ├── 04-storage/
    ├── 05-synchronization/
    ├── 06-market-representation/
    ├── 07-feature-engineering/
    ├── 08-trading-knowledge/
    ├── 09-analysis-engine/
    ├── 10-ai-core/
    ├── 11-learning-and-self-correction/
    ├── 12-prediction/
    ├── 13-discovery-engine/
    ├── 14-experiment-lab/
    ├── 15-validation/
    ├── 16-signal-engine/
    ├── 17-strategy-engine/
    ├── 18-risk-engine/
    ├── 19-execution/
    ├── 20-knowledge-base/
    ├── 21-runtime-modes/
    ├── 22-resource-management/
    ├── 23-observability/
    ├── 24-configuration/
    ├── 25-ingestion-and-external-data/
    ├── 26-research/
    ├── 27-risk-and-safety/
    ├── 28-operations/
    └── 29-roadmap/
```

## Documentation Entry Points

| Document | Description |
|----------|-------------|
| [docs/README.md](docs/README.md) | Documentation home |
| [docs/INDEX.md](docs/INDEX.md) | Full index of all docs |
| [docs/REGISTRY.md](docs/REGISTRY.md) | Official registry of documents & entities |
| [docs/GLOSSARY.md](docs/GLOSSARY.md) | Glossary of terms |
| [docs/00-project/](docs/00-project/) | Vision, mission, principles, scope |
| [docs/decisions/](docs/decisions/) | Architecture Decision Records (ADRs) |
| [docs/29-roadmap/](docs/29-roadmap/) | Development phases & roadmap |

## Important Disclaimers

This project does **not** guarantee:

- Guaranteed profit
- Fixed accuracy or win rate
- Permanent valuable discoveries
- True causation of all market moves
- Perfect price prediction
- Complete elimination of errors or losses

Instead the system must measure, report uncertainty, record failures, support rollback, keep evidence, and keep Candidates distinct from Truth.

## License

MIT License — see [LICENSE](LICENSE).

## Status

```
Repository: Created
Production Code: Not Written
Live Trading: Disabled
Phase: Documentation First
```
