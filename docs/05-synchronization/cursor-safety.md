---
id: DOC-SYNC-015
title: Cursor Safety Transaction Boundary
status: reviewed
version: 0.2
phase: 0
domain: 05-synchronization
---

# Cursor Safety

## Only allowed order
```text
download → validate → publish → commit → advance cursor (last_persisted)
```

## Forbidden
```text
download → advance cursor → crash
```

`last_seen` may move for diagnostics without implying durability.
