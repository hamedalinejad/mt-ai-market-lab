---
id: DOC-PATH-25-INGESTION-AND-EXTERNAL-DATA-EVENT-DATA-MD
title: Event / News Data
status: draft
version: 0.2
phase: 0
domain: 25-ingestion-and-external-data
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-ING-002, DOC-VAL-013]
---

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
