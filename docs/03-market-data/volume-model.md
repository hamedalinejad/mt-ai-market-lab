---
id: DOC-DATA-028
title: Volume Model
status: reviewed
version: 0.3
phase: 0
domain: 03-market-data
---

# Volume Model

## Fields
```text
volume_type ∈ {tick_volume, real_volume, trade_volume, unknown}
volume_semantics  # broker/asset-class specific note id
```

FX often tick_volume only; crypto/CFD may differ — never assume interchangeability without volume_type.
