---
id: DOC-PATH-23-OBSERVABILITY-EVENT-LOG-MD
title: Event Log
status: draft
version: 0.2
phase: 0
domain: 23-observability
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-OBS-001]
related: [DOC-AI-014, DOC-SIG-012]
---

# Event Log

## Purpose

**Immutable** append-only log for debug, audit, and reconstruction of past runs.

## Why

If a model emits a signal today and behavior changes tomorrow, the prior run must be reconstructible from:

- event log
- model version
- feature version
- data snapshots / cursors referenced by events

## Rules

- No in-place edit or delete of emitted events (retention may archive, not rewrite).
- Event ids are unique; append is the only write mode.
- Pair with immutable model artifacts and signal traces.
