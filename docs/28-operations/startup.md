---
id: DOC-OPS-001
title: Startup Sequence
status: reviewed
version: 0.5
phase: 0
domain: 28-operations
updated: 2026-09-04
---

# Startup Sequence (BUG-OPS-P0-002)

```text
Load config
→ Validate config
→ Acquire lock
→ Open SQLite
→ Run migrations
→ Load registry
→ Check filesystem
→ Check disk space
→ Initialize logging
→ Connect MT5
→ Validate broker/account
→ Reconcile
→ Load model
→ Health checks
→ Enter runtime mode
```

Not `start → run`. Fail closed on integrity errors.
