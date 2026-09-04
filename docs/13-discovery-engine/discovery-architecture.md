---
id: DOC-PATH-13-DISCOVERY-ENGINE-DISCOVERY-ARCHITECTURE-MD
title: Discovery Architecture
status: draft
version: 0.2
phase: 0
domain: 13-discovery-engine
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-MASTER-001]
related: [DOC-CONTRACT-IF-001]
---

# Discovery Architecture

Discovery is **data-source agnostic**. It must not branch on MT5 vs CSV vs Parquet vs Replay — only on canonical datasets and feature snapshots.

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

