---
id: DOC-CONTRACT-001
title: Contracts — Source of Truth
status: reviewed
version: 0.6
phase: 0
domain: contracts
updated: 2026-09-03
---

# Contracts — Single Source of Truth

Binding contracts live **only** under:

```text
docs/contracts/
├── data/           # entity data contracts
├── interfaces/     # service interfaces
├── events/         # event envelope + catalogs
├── schemas/        # logical/physical schema targets
├── database/       # SQLite notes (may point to schemas)
├── errors/
├── TREE-INTEGRITY.md
└── README.md
```

Domain folders (e.g. `31-data-contracts`) are **indexes only** — they must not duplicate field lists.
