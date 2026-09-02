---
id: DOC-DISC-001
title: Discovery Architecture
status: draft
version: 0.2
phase: 0
domain: 13-discovery-engine
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-MASTER-001]
related: [DOC-CONTRACT-IF-001]
---

# Discovery Architecture

Discovery is **data-source agnostic**. It must not branch on MT5 vs CSV vs Parquet vs Replay — only on canonical datasets and feature snapshots.
