---
id: DOC-RUN-011
title: Live vs Research Formalization
status: draft
version: 0.2
phase: 0
domain: 21-runtime-modes
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-RUN-001]
---

# Live vs Research

## Live

real-time analysis, light learning, prediction, signal, monitoring

## Training / Research

historical training, discovery, deep search, validation, model generation, strategy discovery

Separate processes; Promotion is the bridge.

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

