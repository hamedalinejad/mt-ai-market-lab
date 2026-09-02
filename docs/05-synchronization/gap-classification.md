---
id: DOC-SYNC-004
title: Gap Classification
status: reviewed
version: 0.4
phase: 0
domain: 05-synchronization
---

# Gap Classification (binding)

| Class | expected? | auto-repairable? | alert |
|-------|-----------|------------------|-------|
| market_closed | yes | no fill needed | INFO |
| holiday | yes | no | INFO |
| session_break | yes | no | INFO |
| source_unavailable | no | retry backfill | WATCH/HIGH |
| transport_failure | no | retry | WATCH |
| storage_failure | no | repair storage | RISK/SYSTEM |
| corrupt_data | no | quarantine+resync | RISK |
| unknown | no | escalate | WATCH+ |

Each Gap row stores: class, expected flag, repair policy, severity, escalation.
