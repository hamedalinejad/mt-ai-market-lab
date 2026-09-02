---
id: DOC-MT5-009
title: Integration Boundary
status: reviewed
version: 0.4
phase: 0
domain: 02-metatrader
updated: 2026-09-02
depends_on: [ADR-0008]
related: [DOC-CONTRACT-IF-001]
---

# MT5 Boundary (binding)

Only **MT5Adapter / MarketDataProvider implementations** may `import MetaTrader5`.

## Enforcement
Static test / CI grep: fail if `MetaTrader5` or `import mt5` appears outside approved adapter packages/modules.

Downstream domains consume Canonical schemas only.
