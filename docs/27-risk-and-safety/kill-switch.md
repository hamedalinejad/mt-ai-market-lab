---
id: DOC-SAFE-003
title: Kill Switch
status: reviewed
version: 0.4
phase: 0
domain: 27-risk-and-safety
updated: 2026-09-04
---

# Kill Switch (B-034)

Independent of model/feature/discovery failures.

## State machine (binding)
ARMABLE → ARMED → TRIGGERED → HALTED → (authorized) RESET

## Policy numbers
Thresholds (e.g. daily loss %) are **Candidate policy parameters** in `policy_version` — not hard-coded magic in architecture prose.

Must define: account scope, session scope, realized vs unrealized, reset authorization, audit trail, fail-safe default **HALT**.
