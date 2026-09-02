---
id: DOC-MT5-017
title: Connection Contract
status: reviewed
version: 0.2
phase: 0
domain: 02-metatrader
---

# Connection State Machine

```text
DISCONNECTED → CONNECTING → CONNECTED
                    ↓
               DEGRADED ↔ RECONNECTING
                    ↓
                 FAILED
```

Transitions emit events. FAILED → Safe Mode / alert per policy. Reconnect uses backoff (ops retry policy).
