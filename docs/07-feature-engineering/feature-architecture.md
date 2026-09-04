---
id: DOC-PATH-07-FEATURE-ENGINEERING-FEATURE-ARCHITECTURE-MD
title: Feature Architecture
status: reviewed
version: 0.4
phase: 0
domain: 07-feature-engineering
---

# Feature Architecture

Binding contracts: `docs/contracts/data/feature.md`, `feature-snapshot.md`, `label.md`.

## Regenerability
| Mode | Meaning |
|------|---------|
| persisted | written to feature store / parquet |
| cached | ephemeral speed layer |
| on_demand | compute at read from canonical + definition_version |

Changing definition_version invalidates prior snapshots for that id.
