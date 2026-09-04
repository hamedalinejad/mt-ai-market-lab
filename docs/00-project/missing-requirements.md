---
id: DOC-PROJ-040
title: Missing Requirements Catalog
status: reviewed
version: 0.2
phase: 0
domain: 00-project
updated: 2026-09-04
---

# Missing Requirements (tracked)

These are **not** vertical-slice blockers unless marked. Implementation may start on approved slice without completing all rows.

## Technical
| ID | Topic | Location intent | Notes |
|----|-------|-----------------|-------|
| REQ-TECH-001 | CI/CD docs pipeline | `.github/workflows/` | Partial: `docs-gates.yml` exists; extend lint/link-check/registry-sync |
| REQ-TECH-002 | Doc validation tool | `tools/validate_docs.py` | Partial: ID uniqueness; extend TBD-in-approved, links |
| REQ-TECH-003 | Schema validation | `docs/contracts/schemas/json/` | Partial: event + candle JSON Schema; expand + optional Pydantic later |
| REQ-TECH-004 | Test infrastructure | `tests/` | After first `src/` package |
| REQ-TECH-005 | Docker | `Dockerfile` | Optional; MT5 often host Windows-native |
| REQ-TECH-006 | Logging framework | observability | Spec: JSON structured logs, levels, rotation, retention |
| REQ-TECH-007 | Configuration mgmt | configuration | TOML/YAML/Env; secrets out of git; Pydantic Settings candidate |
| REQ-TECH-008 | DB migrations runner | migration-contract.md | Contract exists; runner code later |

## Security
| ID | Topic | Notes |
|----|-------|-------|
| REQ-SEC-001 | Encryption at rest | Sensitive secrets/account material; Fernet/AES-GCM candidate |
| REQ-SEC-002 | API key management | OS keyring + rotation policy |
| REQ-SEC-003 | Audit trail | Append-only risk/execution decisions (event_log) |

## Operational
| ID | Topic | Notes |
|----|-------|-------|
| REQ-OPS-001 | Monitoring/alerting | Laptop-light; events first, Prometheus optional |
| REQ-OPS-002 | Health checks | liveness / readiness / deep |
| REQ-OPS-003 | Backup/DR | RPO/RTO + restore drill; see backup.md |
| REQ-OPS-004 | Resource limits | soft/hard limits per profile |

## Business / Legal
| ID | Topic | Notes |
|----|-------|-------|
| REQ-BIZ-001 | Regulatory awareness | Jurisdiction-dependent; checklist before live |
| REQ-BIZ-002 | Risk disclosure | README / user-facing warnings |
| REQ-BIZ-003 | Dependency licenses | pip-licenses / FOSSA before distribution |

## UX
| ID | Topic | Notes |
|----|-------|-------|
| REQ-UX-001 | CLI design | Typer/Click + Rich candidate |
| REQ-UX-002 | Error messages | error-taxonomy actionable codes |
| REQ-UX-003 | Progress reporting | long sync/train/backtest via events + progress UI |
