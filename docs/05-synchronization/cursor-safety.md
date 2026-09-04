---
id: DOC-SYNC-015
title: Cursor Safety
status: approved
version: 1.0
phase: 0
domain: 05-synchronization
created: 2026-09-04
updated: 2026-09-04
depends_on: ['DOC-SYNC-004']
---

# Cursor Safety

See gap-classification recovery section for full protocol.

```text
AC-SYNC-01
Given publish fails after download
When process restarts
Then last_persisted is unchanged

AC-SYNC-02
Given publish succeeds
When cursor advances
Then published batch is fully visible to readers
```
