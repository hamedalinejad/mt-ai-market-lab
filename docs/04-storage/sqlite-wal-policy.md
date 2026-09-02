---
id: DOC-STOR-016
title: SQLite WAL Policy
status: draft
version: 0.2
phase: 0
domain: 04-storage
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-STOR-014]
related: [DOC-STOR-017]
---

# SQLite WAL Policy

For metadata/state DB:

```text
checkpoint policy
busy timeout
transaction policy
backup policy
recovery
```

WAL sidecar files must be included correctly in backup/copy procedures.
