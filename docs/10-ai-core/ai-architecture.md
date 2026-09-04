---
id: DOC-PATH-10-AI-CORE-AI-ARCHITECTURE-MD
title: AI Architecture
status: draft
version: 0.2
phase: 0
domain: 10-ai-core
created: 2026-09-01
updated: 2026-09-02
depends_on: [ADR-0003, ADR-0011]
related: [DOC-CONTRACT-IF-001, DOC-AI-015]
---

# AI Architecture

AI consumes **Market State / Feature Set**, not MT5/CSV/Parquet source details. Source-agnostic by contract.

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

