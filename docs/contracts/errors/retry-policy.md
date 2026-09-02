---
id: DOC-ERR-002
title: Retry Policy
status: draft
version: 0.2
phase: 0
domain: contracts
created: 2026-09-02
updated: 2026-09-02
depends_on: [DOC-ERR-001]
---

# Retry Policy

| Situation | Action |
|-----------|--------|
| connection timeout | retry (backoff) |
| invalid symbol | do not retry |
| corrupt data | quarantine |
| database locked | backoff |
| disk full | stop / safe mode |

## Exponential backoff

For MT5, network, external sources, storage contention — with caps and jitter.
