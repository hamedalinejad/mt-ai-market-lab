---
id: DOC-CONTRACT-DATA-discovery-candidate
title: Data Contract — Discovery Candidate
status: reviewed
version: 0.8
phase: 0
domain: contracts
updated: 2026-09-04
---

# Discovery Candidate (BUG-DISC-P0-001)

```text
candidate_id
grammar_version
expression_ast
human_readable_expression
complexity
novelty
equivalence_class
search_run_id
dataset_snapshot_id
feature_inputs
parameters
evaluation_summary
validation_status
promotion_status
lineage
multiplicity_family_id
hypothesis_count
effective_search_count
status
```

Discovery **must not** emit live Signals directly (see pipeline doc).

## Acceptance Criteria

```text
AC-01
Given this document is binding for its domain
When an implementer builds against it
Then behavior must satisfy the stated invariants and contracts herein
And violations fail validation or static gates before promotion
```

```text
AC-02
Given status is not approved
When production code for this scope is proposed
Then it must be rejected until status reaches approved
```

