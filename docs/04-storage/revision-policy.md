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

