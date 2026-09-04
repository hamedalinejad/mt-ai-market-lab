---
id: DOC-CONTRACT-DATA-tf-policy
title: Canonical Timeframe Policy
status: approved
version: 1.0
phase: 0
domain: contracts
created: 2026-09-04
updated: 2026-09-04
---

# Timeframe Policy

```text
M1              canonical base bar
Ticks           selective evidence (not mandatory every instrument)
Higher TFs      derived by default
Source-native HTF  exception when broker/session/depth requires
```

Derived TF lineage required:

```text
derived_from
aggregation_definition_version
timezone/session policy version
source coverage completeness
```

Incomplete base coverage ⇒ derived bar cannot silently be `CANDLE_CLOSED`.
