---
id: DOC-VAL-001
title: Adversarial Validation
status: draft
version: 0.2
phase: 0
domain: 15-validation
created: 2026-09-01
updated: 2026-09-02
depends_on: [ADR-0012, DOC-VAL-022]
related: [DOC-VAL-015]
---

# Adversarial Validation

## Purpose

Actively try to break the Candidate before Promotion.

## Attack families (candidates)

- Parameter perturbation  
- Time window shift  
- Regime stress  
- Bootstrap / resampling  
- Noise injection  
- Feature removal  
- Alternate splits  
- Cost/slippage stress  
- Symbol / timeframe transfer  

## Rules

- Soft Candidates that fail adversarial suite do not Promote.
- Attacks and outcomes are logged for audit.
