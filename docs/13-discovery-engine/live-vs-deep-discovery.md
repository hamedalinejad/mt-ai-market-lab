---
id: DOC-DISC-019
title: Live vs Deep Discovery
status: draft
version: 0.2
phase: 0
domain: 13-discovery-engine
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-RUN-001, DOC-RES-009]
---

# Live vs Deep Discovery

| Mode | Behavior |
|------|----------|
| Live | Fast incremental discovery; **tiny** CPU/RAM/depth/candidate budget |
| Research / Offline | Deep discovery full search |

Deep discovery must not run inside Live process by default.
