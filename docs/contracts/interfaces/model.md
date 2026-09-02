---
id: DOC-CONTRACT-IF-model
title: Interface — ModelAdapter / ModelRegistry
status: draft
version: 0.2
phase: 0
domain: contracts
---

# Interface: ModelAdapter & Registry

## ModelAdapter

fit (offline), predict, save_artifact, load_artifact

## Registry

list_models, get_active, promote, rollback, retire, compare

## Idempotency

promote/rollback recorded as events; artifacts immutable.
