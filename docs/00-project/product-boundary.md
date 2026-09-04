---
id: DOC-PROD-001
title: Product Boundary
status: draft
version: 0.2
phase: 0
domain: 00-project
created: 2026-09-01
updated: 2026-09-02
---

# Product Boundary

| Component | Core? |
|-----------|-------|
| Core Engine | **Yes** |
| MT5 Connector / Adapter | **Yes** |
| CLI | Yes (operator) |
| Research Tools | Yes (offline path) |
| Desktop UI | Optional / later |
| Notification adapters | Optional channels |

Core remains usable headless (CLI + engine).

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

