---
id: DOC-VAL-025
title: Embargo and Purging
status: draft
version: 0.2
phase: 0
domain: 15-validation
created: 2026-09-02
updated: 2026-09-02
depends_on: [DOC-VAL-013]
related: [DOC-FEAT-018, DOC-VAL-024]
---

# Embargo and Purging

For overlapping label horizons:

- **Purge** samples that overlap the test label span from train
- **Embargo** gap after test boundaries

Required for nested walk-forward and honest OOS.
