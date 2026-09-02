---
id: DOC-CONTRACT-001
title: Contracts Layer — Single Source of Truth
status: draft
version: 0.2
phase: 0
domain: contracts
created: 2026-09-01
updated: 2026-09-02
---

# Contracts — Binding Source of Truth

```text
docs/contracts/
├── data/          # entity schemas (binding)
├── interfaces/    # method-level interfaces (binding)
├── events/
├── schemas/       # shared types
├── errors/
└── database/      # SQLite logical schema (binding)
```

Domain folders (03-market-data, 31-*, …) hold **narrative architecture** and **indexes**.  
If narrative and contract conflict, **contract wins** until an ADR changes it.

## Policy

- No important contract may have two binding homes.
- Domains 31–35 are indexes pointing here.
