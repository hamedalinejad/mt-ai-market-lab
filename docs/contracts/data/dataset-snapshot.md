---
id: DOC-CONTRACT-DATA-dataset-snapshot
title: Data Contract — dataset-snapshot
status: reviewed
version: 0.7
phase: 0
domain: contracts
updated: 2026-09-04
---

# Data Contract: dataset-snapshot

## Purpose
Binding schema for **dataset-snapshot**.

## Identity
See domain + identity layers (logical / source / physical).

## Fields
### Required
Entity-specific required fields (see prior architecture docs; must be non-null).

### Optional
Entity-specific optional fields.

## Types / Units / Timezone
Timestamps as UTC fields per Time Model. Prices per price representation policy.

## Validity interval
Gated by quality_status and session rules where applicable.

## Provenance
source + source identity retained.

## Version
schema_version; major on identity/invariant breaks.

## Nullability
Required non-null; optional nullable.

## Invariants
Entity-specific invariants enforced at quality gate.

## Examples
### Valid
Valid dataset-snapshot instance satisfying invariants.

### Invalid
Violates invariants or missing required fields.

## Compatibility policy
Forward-compatible optional fields; no silent required-field removal.
