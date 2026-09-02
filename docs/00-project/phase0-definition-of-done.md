---
id: DOC-PROJ-013
title: Phase 0 Definition of Done
status: draft
version: 0.2
phase: 0
domain: 00-project
created: 2026-09-02
updated: 2026-09-02
depends_on: [DOC-PROJ-011, DOC-PROJ-012]
---

# Phase 0 Definition of Done

Phase 0 is done when **every P0 item** has:

1. Requirement statement
2. Architecture placement (which plane/domain)
3. Data or control **Contract**
4. **Schema** (fields, types, invariants, identity)
5. **Interface** (operations, errors, idempotency)
6. Algorithm notes where non-obvious
7. Failure modes + recovery
8. Validation rules
9. Test plan reference (unit/contract/integration)
10. Acceptance criteria checklist

Until then: Documentation First continues; **Trading disabled; no production code.**

## Recommended fill order (first coding gate)

1. Candle + Tick + Quote contracts  
2. MarketDataProvider + MT5Adapter  
3. SyncState + Gap + Quality pipeline  
4. Storage layout + WAL/backup  
5. Feature + Label contracts  
6. ModelAdapter + Model Registry  
7. Signal + RiskDecision + Order + Execution reconciliation  
8. Validation pipeline + Leakage + Multiple testing  
9. Safety / Safe Mode / Resource budgets  
10. Testing architecture acceptance  
