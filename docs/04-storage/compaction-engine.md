---
id: DOC-STOR-024
title: Compaction Engine
status: reviewed
version: 0.3
phase: 0
domain: 04-storage
---

# Compaction Policy

| Item | Requirement |
|------|-------------|
| trigger | file count / size threshold / schedule (resource-aware) |
| target file size | versioned policy |
| row group size | versioned policy |
| concurrent readers | old files readable until cutover; readers use manifest |
| recovery | compaction job id; partial failure leaves prior manifest active |

Never blocks P0 live path under Emergency / Safe Mode.
