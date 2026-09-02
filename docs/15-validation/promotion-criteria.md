---
id: DOC-VAL-015
title: Promotion Criteria
status: draft
version: 0.2
phase: 0
domain: 15-validation
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-VAL-022, DOC-VAL-014]
related: [DOC-KNOW-001, ADR-0005]
---

# Promotion Criteria

## Purpose

Define when a Candidate may move toward Active Knowledge / Paper / richer status.

## Minimum (search-generated trading-relevant Candidates)

- [ ] Pipeline stages required for artifact type all recorded  
- [ ] Multiplicity accounting present and correction applied  
- [ ] Leakage checks passed  
- [ ] OOS / WF per gate set  
- [ ] Cost + slippage stress per gate set  
- [ ] Adversarial subset passed  
- [ ] No unresolved data-quality issues on eval ranges  

Failure → Rejected or Needs More Evidence; stored in memory.

## Rules

- Promotion is explicit, versioned, reversible.
- discovery_score alone never promotes.
