---
id: DOC-PATH-16-SIGNAL-ENGINE-SIGNAL-DEDUPLICATION-MD
title: Signal Deduplication
status: draft
version: 0.2
phase: 0
domain: 16-signal-engine
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-SIG-002]
---

# Signal Deduplication

Fingerprint (example):

```text
symbol | timeframe | direction | strategy | source | generation window
```

## Acceptance Criteria

```text
AC-01
Given this document is binding for its domain
When an implementer builds against it
Then behavior must satisfy the stated invariants and contracts herein
And violations fail validation or static gates before promotion
```

```text
AC-02
Given status is not approved
When production code for this scope is proposed
Then it must be rejected until status reaches approved
```

