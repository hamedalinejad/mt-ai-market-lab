---
id: DOC-CONTRACT-DATA-quote
title: Data Contract — Quote
status: reviewed
version: 0.7
phase: 0
domain: contracts
updated: 2026-09-04
---

# Quote Semantics (BUG-P0-015)

## Source facts
```text
bid, ask, last (optional)
```

## Derived (not source fact)
```text
mid = (bid + ask) / 2
spread = ask - bid
```

Mid must be labeled derived. Never treat mid as an independent broker print unless source explicitly provides it.
