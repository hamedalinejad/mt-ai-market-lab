---
id: DOC-TEST-001
title: Testing Architecture
status: reviewed
version: 0.5
phase: 0
domain: 30-testing
---

# Test Strategy

## Suites
unit | integration | contract | data | replay | backtest | model | discovery | execution | recovery | performance | end-to-end

## Merge gate (minimum)
- unit pass
- contract pass
- data invariant pass
- leakage tests pass
- deterministic replay pass
- no unauthorized MT5 imports
- no schema drift
