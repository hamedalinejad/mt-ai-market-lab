---
id: DOC-ING-MERGED-001
title: external-data
status: reviewed
phase: 0
created: 2026-09-04
updated: 2026-09-04
depends_on: []
related: []
---
> **Note:** Domain narrative consolidated from multiple former files. Binding contracts remain under `docs/contracts/`. Sections marked TBD are not Phase-0 binding.


# external-data


<!-- merged from docs/25-ingestion-and-external-data/schema-mapping.md -->

# schema mapping

## Purpose

Specification for **schema mapping** within the 25-ingestion-and-external-data domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/25-ingestion-and-external-data/parquet-import.md -->

# parquet import

## Purpose

Specification for **parquet import** within the 25-ingestion-and-external-data domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/25-ingestion-and-external-data/external-data-boundary.md -->

# External Data Boundary

News, calendar, sentiment, rates, macro, on-chain, etc. stay **outside** the core MT5 market data contract. Separate schemas and joins with explicit availability times.


<!-- merged from docs/25-ingestion-and-external-data/deduplication.md -->

# deduplication

## Purpose

Specification for **deduplication** within the 25-ingestion-and-external-data domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/25-ingestion-and-external-data/provenance.md -->

# provenance

## Purpose

Specification for **provenance** within the 25-ingestion-and-external-data domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/25-ingestion-and-external-data/external-data-architecture.md -->

# external data architecture

## Purpose

Specification for **external data architecture** within the 25-ingestion-and-external-data domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/25-ingestion-and-external-data/dataset-validation.md -->

# dataset validation

## Purpose

Specification for **dataset validation** within the 25-ingestion-and-external-data domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/25-ingestion-and-external-data/data-lineage.md -->

# Data Lineage

End-to-end provenance:

```text
MT5 → Raw → Canonical → Feature → Model → Prediction
  → Signal → Strategy → Risk → Execution
```

Each stage records ids/versions (dataset, feature, model, config, cost bundle).


<!-- merged from docs/25-ingestion-and-external-data/timestamp-normalization.md -->

# timestamp normalization

## Purpose

Specification for **timestamp normalization** within the 25-ingestion-and-external-data domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/25-ingestion-and-external-data/symbol-mapping.md -->

# symbol mapping

## Purpose

Specification for **symbol mapping** within the 25-ingestion-and-external-data domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD


<!-- merged from docs/25-ingestion-and-external-data/event-data.md -->

# Event / News Data

## Leakage control

Require:

```text
publication_time
release_time
revision_time
availability_time
```

Not only `event_date`. Promotable features may use only information available at decision time.


<!-- merged from docs/25-ingestion-and-external-data/csv-import.md -->

# csv import

## Purpose

Specification for **csv import** within the 25-ingestion-and-external-data domain.

## Scope

Phase 0 — Documentation First.

## Requirements

TBD — refined from Master Blueprint.

## Open Questions

TBD

