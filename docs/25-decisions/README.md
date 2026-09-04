---
id: DOC-25-README
title: Decisions Compat Path
status: reviewed
version: 0.3
phase: 0
---

# 25-decisions — NOT canonical

**Canonical ADRs live only in:** `docs/decisions/`

This folder is a compatibility stub. Do not add new ADR bodies here.
Supersession: `docs/conventions/adr-supersession.md`.

## Acceptance Criteria

```text
AC-01
Given an ADR is authored
When it is merged
Then it must live under docs/decisions/ with unique ADR-#### id
And any supersession sets superseded_by on the old ADR
```
