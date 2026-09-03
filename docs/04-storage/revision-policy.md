---
id: DOC-STOR-031
title: Data Revision Policy
status: reviewed
version: 0.2
phase: 0
domain: 04-storage
updated: 2026-09-04
---

# Data Revision Policy (BUG-P0-020)

When broker/history changes:

```text
raw_v1 → canonical_v1
revision_detected
raw_v2 → canonical_v2
```

**Forbidden:** silent overwrite of prior canonical/raw versions.

Models/experiments pin `dataset_snapshot_id` / revision so training lineage remains known.
