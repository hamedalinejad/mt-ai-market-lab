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

