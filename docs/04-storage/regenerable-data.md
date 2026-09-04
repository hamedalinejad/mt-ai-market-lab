---
id: DOC-STOR-026
title: Regenerable vs Non-Regenerable Data
status: draft
version: 0.2
phase: 0
domain: 04-storage
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-STOR-025]
---

# Regenerable vs Non-Regenerable

| Kind | Nature |
|------|--------|
| Raw MT5 / broker prints | Expensive to reacquire — treat as non-regenerable |
| Feature / indicator | Regenerable from canonical + definition version |
| Model | Reproducible artifact if pins complete |
| Experiment / Knowledge record | Immutable record |

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

