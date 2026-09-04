---
id: DOC-PROJ-031
title: Requirements System
status: reviewed
version: 0.3
phase: 0
domain: 00-project
updated: 2026-09-04
---

# Requirements

Each requirement should eventually have:

```text
requirement_id
source
owner
status
acceptance_criteria
downstream_specs[]
```

## Catalog (inline — former requirements-catalog.md)

Covered domains (detail in `docs/contracts/` and approved slice docs):

- **DATA:** identity, time, tick, quote, candle, gap, quarantine, provenance, quality, dedup, revision, retention  
- **STORAGE:** raw immutable, canonical, atomic publish, manifest, checksum, snapshot  
- **SYNC:** cursor, crash-safe tx, backoff, gap resolver  
- **MT5:** connection, symbols, rates/ticks, adapter boundary  
- **AI/VAL/TRD/OPS:** see contracts + vertical-slice.md  

## Traceability (inline — former TRACEABILITY.md)

| Area | Contract | Spec | ADR | Test |
|------|----------|------|-----|------|
| Data | contracts/data/* | 03-market-data, 04-storage | storage ADR | data/static gates |
| Sync | interfaces/sync-engine | 05-synchronization | — | recovery |
| MT5 | market-data-provider | 02-metatrader | ADR-0008 | mt5-contract-tests |
| AI | model, prediction | 10-ai-core | ADR-0003 | model tests |
| Risk | risk-decision | 18-risk-engine | ADR-0009 | risk gates |
| Ops | safe-mode | 21-runtime-modes | — | startup/recovery |

Broken external links to deleted catalog files have been removed.
