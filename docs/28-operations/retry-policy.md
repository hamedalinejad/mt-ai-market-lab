---
id: DOC-OPS-003
title: Retry Policy
status: draft
version: 0.2
phase: 0
domain: 28-operations
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-CONTRACT-ERR-001]
related: [DOC-OPS-004]
---

# Retry Policy

Not every error is retried.

| Example | Action |
|---------|--------|
| connection timeout | retry |
| invalid symbol | do not retry |
| corrupt data | quarantine |
| database locked | backoff |
| disk full | stop / Safe Mode |

## Exponential Backoff

For MT5, network, external source, storage contention.
