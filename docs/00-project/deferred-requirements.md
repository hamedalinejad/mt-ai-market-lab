---
id: DOC-PROJ-035
title: Deferred Requirements P1/P2
status: reviewed
version: 0.2
phase: 0
domain: 00-project
updated: 2026-09-04
---

# Deferred until after Vertical Slice

Explicitly **not** blocking first coding slice:

| ID area | Examples | When |
|---------|----------|------|
| Macro / external intel | economic calendar deep integration | after paper path stable |
| Reporting UX | daily research/signal reports | after observability events stable |
| Architecture fitness automation | machine-checkable coupling rules beyond current static gates | after package layout exists |
| Advanced notification | quiet hours, multi-channel | after signal lifecycle live |
| Knowledge decay automation | revalidation schedules | after knowledge promotion works |

## Acceptance Criteria

```text
AC-01
Given vertical slice is not complete
When planning sprints
Then these deferred items must not displace Data/Sync/Replay/Baseline/Paper work
```
