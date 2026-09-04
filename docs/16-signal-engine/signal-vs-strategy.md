---
id: DOC-SIG-010
title: Signal vs Strategy Separation
status: reviewed
version: 0.2
phase: 0
domain: 16-signal-engine
updated: 2026-09-04
---

# Signal ≠ Strategy (BUG-TRD-P0-001)

| Layer | Meaning |
|-------|---------|
| **Signal** | What was observed / inferred and with what confidence |
| **Strategy** | What action policy is proposed given signals + context |

Must not merge into one object. Strategy consumes signals; signals do not embed order instructions.
