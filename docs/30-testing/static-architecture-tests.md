---
id: DOC-TEST-005
title: Static Architecture Tests
status: reviewed
version: 0.3
phase: 0
domain: 30-testing
updated: 2026-09-04
---

# Static Architecture Tests

| ID | Rule |
|----|------|
| A | No non-MT5 domain imports MetaTrader5 |
| B | No model code imports storage provider directly |
| C | No material signal without valid trace_id |
| D | No promotable artifact without decision_point |
| E | No model promotion without validation_run |
| F | **No random shuffle of temporal rows for promotable temporal claims** (BUG-VAL-P0-003) |
