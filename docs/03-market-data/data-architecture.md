---
id: DOC-DATA-001
title: Data Architecture
status: draft
version: 0.2
phase: 0
domain: 03-market-data
created: 2026-09-01
updated: 2026-09-01
depends_on: [DOC-MASTER-001, DOC-STOR-014]
related: [DOC-DATA-003, DOC-DATA-011, DOC-SYNC-001]
---

# Data Architecture

## Purpose

Define how market data moves from sources into **Canonical** models used by Representation, Analysis, AI and Discovery.

## Principles

- **Data First** — no valid learning without healthy, traceable data.
- **Source diversity, single canonical interface.**
- **Raw retained; Canonical consumed.**
- **Quality before promotion into analysis.**

## Sources

1. MetaTrader 5 (live + historical)
2. External files (Parquet, CSV) via ingestion pipeline

## Layers

```text
Source
  → Ingestion Adapter
  → Raw Store
  → Normalization (timezone, symbol map, units)
  → Data Quality / Gap / Dedup
  → Canonical Store
  → Derived (Features, Labels)
  → Consumers (Analysis, AI, Discovery, Validation)
```

## Canonical Entities

| Entity | Doc |
|--------|-----|
| Instrument | instrument-model.md |
| Tick | tick-model.md |
| Candle | candle-model.md |
| Quote | quote-model.md |
| Timeframe | timeframe-model.md |
| Derived Feature | feature docs / derived-data-model.md |

## Cross-Cutting

- **Lineage:** every canonical batch links to source + sync_run / import_run.
- **Versioning:** schema_version on partitions; instrument metadata_version.
- **Timezone:** all canonical timestamps UTC (`timezone-policy.md`).

## Rules

- Consumers below Representation **must not** parse MT5-specific structures.
- Incomplete quality_status must not silently enter training datasets.
- Discovery and Prediction read Canonical or Feature stores only.
