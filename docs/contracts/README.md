---
id: DOC-CONTRACT-001
title: Contracts — Source of Truth
status: draft
version: 0.3
phase: 0
domain: contracts
created: 2026-09-01
updated: 2026-09-02
---

# Contracts — Single Source of Truth

**Binding** data contracts, interfaces, events, schemas, and errors live **only** under:

```text
docs/contracts/
├── data/
├── interfaces/
├── events/
├── schemas/          # SQLite/logical ER references
├── errors/
└── README.md
```

Domain folders `docs/31-data-contracts` … `docs/35-dataset-management` are **indexes/pointers only** — they must not duplicate binding field lists.

Narrative architecture remains in domains `00–29`, `30-testing`, `36+`.
