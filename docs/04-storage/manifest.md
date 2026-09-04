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

## Acceptance Criteria

```text
AC-01
Given this document is binding for its domain
When an implementer builds against it
Then behavior must satisfy the stated invariants and contracts herein
And violations fail validation or static gates before promotion
```

```text
AC-02
Given status is not approved
When production code for this scope is proposed
Then it must be rejected until status reaches approved
```

