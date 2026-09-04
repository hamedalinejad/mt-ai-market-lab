---
id: DOC-PATH-22-RESOURCE-MANAGEMENT-GRACEFUL-DEGRADATION-MD
title: Graceful Degradation
status: draft
version: 0.2
phase: 0
domain: 22-resource-management
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-RES-009]
related: [DOC-RUN-009]
---

# Graceful Degradation

## Purpose

When resources breach budget, shed work in priority order without killing data integrity or live monitoring.

## Shed Order (example)

```text
Discovery ↓
Training ↓
Feature cache ↓
Parallelism ↓
Live analysis stays ON
```

## Preserve

- P0 Data Integrity
- P1 MT5 Connection
- P2 Live Analysis

## Rules

- Degradation is automatic, observable, and reversible.
- Never drop integrity checks to “save RAM.”
