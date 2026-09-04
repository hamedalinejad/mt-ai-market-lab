---
id: DOC-CONTRACT-DATA-quote
title: Data Contract — Quote
status: approved
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

