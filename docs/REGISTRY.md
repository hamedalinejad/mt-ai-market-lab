---
id: DOC-0003
title: Registry
status: reviewed
version: 0.3
phase: 0
domain: docs
updated: 2026-09-04
---

# Registry

Authoritative catalog of documentation artifacts.

**Honesty rule:** Registration ≠ Specification complete. Status lifecycle: draft → reviewed → approved → implemented → verified → deprecated.

See [INDEX.md](INDEX.md) for full path listing.  
Requirements: [00-project/REQUIREMENTS.md](00-project/REQUIREMENTS.md)  
Core principles: [00-project/core-principles.md](00-project/core-principles.md)

Entity types: Document, ADR, Requirement, Interface, DataContract, Schema, Experiment, Hypothesis, Model, Discovery — extend rows as artifacts mature.

**ADR policy:** single canonical path under `docs/decisions/` (or project decisions folder); superseded ADRs must set `superseded_by` (see conventions/adr-supersession.md).
