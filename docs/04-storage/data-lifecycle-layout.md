---
id: DOC-STOR-030
title: Data Lifecycle Layout
status: reviewed
version: 0.2
phase: 0
domain: 04-storage
updated: 2026-09-04
---

# Raw / Clean / Canonical / Quarantine (BUG-P0-011)

```text
data/
├── raw/
├── canonical/
├── derived/
├── quarantine/
├── manifests/
└── checkpoints/
```

## Rules
- Bad or suspect data → **quarantine**, never silent in-place replace of canonical.
- Publish path: raw → validate → canonical (atomic) or quarantine.
- derived/ holds materializations (e.g. derived TFs, features) with own manifests.
- manifests/ and checkpoints/ support recoverability and cursor safety.
