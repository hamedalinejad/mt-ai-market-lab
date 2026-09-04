---
id: DOC-CONV-012
title: Document ID Scheme
status: reviewed
version: 0.2
phase: 0
---

# Document ID Scheme (BUG-HIGH-004)

| Prefix | Use |
|--------|-----|
| `DOC-000x` | Top-level docs (README, INDEX, REGISTRY, GLOSSARY) |
| `DOC-PROJ-*` | 00-project |
| `DOC-CONV-*` | conventions |
| `DOC-CONTRACT-*` | contracts/data, interfaces, events, schemas |
| `DOC-{DOMAIN}-*` | Domain narrative (e.g. DOC-DATA-*, DOC-SYNC-*) |
| `DOC-*-MERGED-*` | Consolidated former multi-file domains |
| `DOC-PATH-*` | Auto-assigned after ID collision repair (may be renamed later) |
| `ADR-####` | Architecture Decision Records only under `docs/decisions/` |

New documents **must** use a unique ID; Registry generation fails CI conceptually if duplicates exist.
