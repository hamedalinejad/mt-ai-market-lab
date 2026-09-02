---
id: DOC-STOR-028
title: Dataset / Partition Manifest
status: reviewed
version: 0.2
phase: 0
domain: 04-storage
---

# Manifest

Every published dataset or partition set carries:

```text
manifest_id
dataset_version
files[]
checksums[]
row_counts
time_ranges
schema_version
created_at
```

Readers trust manifest over directory listing alone.
