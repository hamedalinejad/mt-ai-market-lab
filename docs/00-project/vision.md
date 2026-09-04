---
id: DOC-PATH-00-PROJECT-VISION-MD
title: Vision
status: draft
version: 0.1
phase: 0
domain: 00-project
created: 2026-09-01
updated: 2026-09-01
depends_on: []
related: []
---

# Vision

Create an intelligent market laboratory that can:

1. Connect to MetaTrader 5
2. Discover and manage selected symbols
3. Ingest live and historical data
4. Backfill and synchronize after downtime or disconnection
5. Store multi-year data in a lightweight architecture usable on a laptop
6. Import external data (Parquet, CSV)
7. Model Forex, Crypto and other supported asset classes
8. Analyze known candles, patterns, market structure, indicators and features
9. Discover unknown structures
10. Propose new Features, Indicators, Formulas, Patterns, Relationships, Signals and Strategies
11. Predict price, direction, return, range, volatility and future candle behavior
12. Perform light live analysis and learning
13. Train on historical data
14. Learn from past errors
15. Retire weak models or obsolete knowledge
16. Subject new hypotheses to Validation and Adversarial Testing before acceptance
17. Examine relationships between symbols and markets
18. Distinguish Correlation from Causation
19. Produce explainable signals
20. Support Paper Trading and later Controlled Live Trading
21. Run everything with resource management suitable for a laptop

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

