---
id: DOC-VAL-013
title: Leakage Prevention
status: draft
version: 0.2
phase: 0
domain: 15-validation
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-VAL-022]
related: [DOC-VAL-016]
---

# Leakage Prevention

## Purpose

Prevent future information, label leakage, and cross-split contamination.

## Checks

- Timestamp alignment and bar-close rules  
- Feature availability at decision time  
- No scaling fit on full dataset including test  
- No gap-fill using future bars  
- Search does not use holdout  

## Rules

- Leakage failure is hard-fail for Promotion.
