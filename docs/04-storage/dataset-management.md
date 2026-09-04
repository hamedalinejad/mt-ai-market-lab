---
id: DOC-STOR-DATASET
title: Dataset Versioning
status: approved
version: 1.0
phase: 0
domain: 04-storage
created: 2026-09-04
updated: 2026-09-04
---

# Dataset Snapshot Identity

```text
dataset_snapshot_id, schema_version, source set, partition set/URIs,
coverage interval, instrument set, timeframe set,
quality policy version, feature-set version, label-set version,
code version, creation timestamp, checksums
```

**Rule:** A model result without a dataset snapshot is not reproducible evidence.
