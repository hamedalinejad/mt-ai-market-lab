---
id: DOC-DISC-013
title: Novelty Detection
status: draft
version: 0.2
phase: 0
domain: 13-discovery-engine
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-DISC-006, DOC-DISC-008]
related: [DOC-DISC-004, DOC-KNOW-001]
---

# Novelty Detection

## Purpose

Give **novelty** a checkable definition. “New” is not a marketing word.

## Novelty Criteria (any may contribute; policy combines them)

| Criterion | Meaning |
|-----------|---------|
| Not identical to known indicator | Expression/id not equal to catalog entry |
| Not algebraically equivalent | After normalization/simplification, not the same form as an existing formula |
| Not highly correlated with existing feature | \|corr\| below threshold on evaluation windows (threshold versioned) |
| New functional form | Operators/structure outside existing family templates |
| New predictive relationship | Relationship to target not previously registered at comparable lag/horizon |
| New regime dependency | Edge/structure concentrated in regimes not covered by prior knowledge |

## Mathematical / Operational Checks (logical)

```text
novelty_flags = {
  identity_match: bool,
  algebraic_equiv: bool,
  max_abs_corr_to_library: float,
  form_hash: str,
  relationship_key: str,
  regime_profile_distance: float
}
```

A Candidate is **non-novel** if it fails the configured novelty policy (e.g. identity or algebraic match, or corr above threshold without new regime dependency).

## Rules

- Novelty scores are stored on the Discovery record.
- Non-novel duplicates are rejected or merged, not promoted as “new discovery.”
- Correlation thresholds and equivalence rules are versioned with `discovery_space_version`.
