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
