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

