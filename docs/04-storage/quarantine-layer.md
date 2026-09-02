---
id: DOC-STOR-020
title: Quarantine Layer
status: reviewed
version: 0.3
phase: 0
domain: 04-storage
---

# Quarantine

Invalid data → `data/quarantine/` (or equivalent store) with reason + batch id.

**Never silently drop.** Promotion/training paths exclude quarantine by default.
