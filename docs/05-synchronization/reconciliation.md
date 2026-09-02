---
id: DOC-SYNC-009
title: Reconciliation
status: reviewed
version: 0.4
phase: 0
domain: 05-synchronization
---

# Reconciliation

Not row-count alone. Compare:

```text
timestamp set
OHLC
spread
volume
metadata
source provenance
```

Same timestamp + different OHLC ⇒ ohlc_conflict → quarantine → repair → verify.
