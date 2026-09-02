---
id: DOC-MT5-013
title: Reconnect
status: draft
version: 0.2
phase: 0
domain: 02-metatrader
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-MT5-009]
related: [DOC-OPS-003, DOC-SYNC-013]
---

# MT5 Reconnect

Retry with backoff; after reconnect: verify symbols, sync from last_persisted, reconcile orders/positions if execution enabled. Do not assume in-memory state survived.
