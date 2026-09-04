---
id: DOC-STOR-025
title: Data Retention Policy
status: draft
version: 0.2
phase: 0
domain: 04-storage
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-STOR-014]
related: [DOC-STOR-026]
---

# Data Retention Policy

```text
recent ticks → full
old ticks → compressed
old bars → permanent (policy)
features → regenerable
models → immutable artifacts
logs/events → retention window
```

Resource profiles may tighten hot/warm windows; never silently drop non-regenerable raw without archive policy.

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

