---
id: DOC-CONTRACT-DATA-time
title: Time Fields Contract
status: reviewed
version: 0.7
phase: 0
domain: contracts
updated: 2026-09-04
---

# Data Time Model — locked

```text
source_timestamp
source_timezone
event_time_utc
availability_time_utc
ingestion_time_utc
processing_time_utc
```

**ML/Validation:** `availability_time_utc` dominates for leakage. Feature usable at T only if `availability_time_utc <= T`.
