---
id: DOC-ING-001
title: Data Lineage
status: draft
version: 0.2
phase: 0
domain: 25-ingestion-and-external-data
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-DATA-001]
related: [DOC-SIG-012, DOC-KNOW-001]
---

# Data Lineage

End-to-end provenance:

```text
MT5 → Raw → Canonical → Feature → Model → Prediction
  → Signal → Strategy → Risk → Execution
```

Each stage records ids/versions (dataset, feature, model, config, cost bundle).
