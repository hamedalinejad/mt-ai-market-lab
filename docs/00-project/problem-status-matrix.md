---
id: DOC-PROJ-060
title: Problem Status Matrix
status: reviewed
version: 1.0
phase: 0
domain: 00-project
created: 2026-09-05
updated: 2026-09-05
depends_on: ['DOC-PROJ-050']
---

# Status matrix of previously identified problems

| ID | Risk | Status | Required action |
|----|------|--------|-----------------|
| P0-01 | Approved docs with TBD | **TOOLING UPDATED** | `tools/validate_docs.py` fails on TBD/TODO in `approved` (except policy language) |
| P0-02 | Availability vs market time | RESOLVED (spec) | Enforce in feature/label/replay tests when code exists |
| P0-03 | Cursor before publish | RESOLVED (spec) | Integration crash-safety test |
| P0-04 | Risk bypass by AI | RESOLVED (spec) | Negative integration tests on order path |
| P0-05 | Duplicate orders on restart | RESOLVED (spec) | Crash-after-submit reconciliation test |
| P0-06 | Arbitrary formula code | RESOLVED (spec) | Allowlisted AST/DSL at implementation |
| P0-07 | Discovery false positives | RESOLVED (spec) | Implement search budget + multiplicity gates |
| P1-01 | HTF lookahead | RESOLVED (spec) | Cross-TF leakage tests |
| P1-02 | Native vs derived TF | RESOLVED (spec) | Lineage fields in storage |
| P1-03 | Revision ambiguity | RESOLVED (spec) | Revision/quarantine tests |
| P1-04 | Live Parquet append | RESOLVED (spec) | Writer policy enforcement |
| P1-05 | Causal language | RESOLVED (spec) | No causal promote from one test |
| P1-06 | Promotion without rollback | RESOLVED (spec) | Model registry integrity checks |
| P1-07 | Cross-market misalignment | RESOLVED (spec) | Alignment test suite |
| P1-08 | Capacity as guarantees | RESOLVED (spec) | Benchmark before lock |
| P1-09 | Control-plane schema vs contracts | PARTIAL | Complete vertical-slice DDL/FKs |
| P2-01 | Manual registry/index | **TOOLING UPDATED** | `python tools/sync_registry.py` + CI |
| P2-02 | Status dependency graph | **CHECKED** | `depends_on` targets validated (warnings) |
| P2-03 | Retry semantics | PARTIAL | Schema/gate for retry fields later |
| P2-04 | Benchmark measurements | NOT RESOLVED | Run suite on target hardware |

Spec-resolved items still need **code-level tests** when implementation starts.
