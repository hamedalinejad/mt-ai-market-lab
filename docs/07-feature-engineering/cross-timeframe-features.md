---
id: DOC-FEAT-003
title: Cross-Timeframe Features
status: draft
version: 0.2
phase: 0
domain: 07-feature-engineering
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-VAL-013, DOC-DATA-023]
related: [DOC-REPR-003]
---

# Cross-Timeframe Features

## Leakage control

An M1 decision must not use an **incomplete** higher-TF bar as if it were closed H1/D1 future knowledge.

Only last **closed** higher-TF bars (or explicitly declared partial-bar semantics) are allowed.
