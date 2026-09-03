---
id: DOC-CONTRACT-EVT-sync-events
title: Events — sync-events
status: reviewed
version: 0.6
phase: 0
domain: contracts
---

# sync-events

Events under prefix `SYNC_*` use the standard [event-envelope](event-envelope.md).

Payload schemas versioned per event_type. Producers must set correlation_id/causation_id for trace chains.
