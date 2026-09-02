---
id: DOC-CONV-005
title: Document Status Model
status: approved
version: 0.3
phase: 0
domain: conventions
created: 2026-09-01
updated: 2026-09-02
---

# Document Status Model

```text
draft → reviewed → approved → implemented → deprecated
```

| Status | Meaning |
|--------|---------|
| draft | Work in progress; not binding for code |
| reviewed | Peer/architecture review done; not yet binding |
| approved | **Binding for implementation** — required before code for that P0 item |
| implemented | Code exists matching approved contract |
| deprecated | Superseded; do not implement against |

**Rule:** No P0 item enters production code implementation without `status: approved`.
