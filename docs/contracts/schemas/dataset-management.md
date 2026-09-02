---
id: DOC-CONTRACT-DATASET-001
title: Dataset Management Contract
status: draft
version: 0.2
phase: 0
domain: contracts
---

# Dataset Management

## Must cover

```text
dataset identity
snapshot
manifest
partitions
labels
feature set
lineage
version
checksum
train / validation / test membership
embargo
purge
availability timestamp
reproducibility pins
```

## Snapshot id example

`dataset-2026-09-01-0001` — immutable; later data fixes do not rewrite old experiments.
