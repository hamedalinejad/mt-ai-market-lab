---
id: DOC-PROJ-050
title: Implementation Baseline — Executive Decision
status: approved
version: 1.0
phase: 0
domain: 00-project
created: 2026-09-04
updated: 2026-09-04
depends_on: []
related: ['DOC-PROJ-030', 'DOC-CONV-010', 'DOC-CONV-011']
---

# Executive Decision — Implementation Baseline

## 0. Project definition

This repository is **not** defined as “an AI trading bot.”

It is a **data-integrity-first market intelligence laboratory** with controlled progression toward decisioning and execution.

No later stage may weaken the invariants of an earlier stage.

## 1. Implementation order (binding)

```text
Repository contracts
    ↓
Control plane + configuration + observability
    ↓
MT5 adapter + canonical market-data ingestion
    ↓
Synchronization / gap recovery / quality gates
    ↓
Storage + dataset snapshots + deterministic replay
    ↓
Market representation + features
    ↓
Baseline prediction
    ↓
Validation + model governance
    ↓
Discovery engine
    ↓
Knowledge / signal / strategy
    ↓
Independent risk authority
    ↓
Paper trading
    ↓
Only after explicit promotion: controlled live execution
```

Coding may begin only for stages whose **binding** documents are complete for that stage’s scope (see §2).

## 2. Status inflation rule (governance)

```text
status=approved  ≠  specification=complete   # INVALID reasoning
```

**Rule:** A document may be `approved` only when, for the claimed implementation scope:

- normative requirements are defined;
- invariants are defined;
- interfaces/contracts referenced are defined;
- acceptance criteria are domain-specific and testable;
- referenced dependencies resolve.

**Prohibited in an approved binding document:**

- open design gaps (prohibited in approved binding docs) for that scope;
- unresolved contradictory semantics;
- incomplete schemas presented as final (prohibited).

Narrative or partial docs must remain `draft` or `reviewed`, not `approved`.

Binding surfaces live primarily under `docs/contracts/` and the vertical-slice package.

## 3. Technology decision states

```text
candidate → benchmarked-candidate → locked
```

| State | Meaning |
|-------|---------|
| **candidate** | May be prototyped **behind an interface** |
| **benchmarked-candidate** | Measured against published protocol |
| **locked** | ADR + benchmark evidence; global default |

A binding contract must **never** assume an unbenchmarked implementation detail (e.g. specific DB engine, ML library) as architecture truth.

## 4. Cross-domain precedence (conflict resolution)

When rules conflict, higher wins:

```text
1. Safety / capital-protection invariants
2. Data integrity and temporal correctness
3. Contract / schema invariants
4. State-machine validity
5. Validation and promotion policy
6. Resource policy
7. Strategy / signal policy
8. AI model preferences
9. Research convenience
```

A lower-priority component cannot override a higher-priority invariant.

## 5. Audit summary (repository state)

Approximately 200+ documentation artifacts exist (see `REGISTRY.md` / `INDEX.md`), covering requirements, architecture, MT5 boundary, market-data, storage, sync, AI governance, discovery, validation/replay, risk/execution, modes, observability, operations, testing, SQLite schema, contracts, conventions, ADRs.

**File existence ≠ specification completeness.**

Strong foundation; implementation must follow this baseline and binding contracts only.

## Acceptance Criteria

```text
AC-BASELINE-01
Given a proposed code change
When it would violate an earlier-stage invariant for convenience
Then it must be rejected

AC-BASELINE-02
Given a document marked approved
When it still contains open design gaps (prohibited placeholders) for its claimed binding scope
Then status must be corrected downward until complete

AC-BASELINE-03
Given a technology choice without benchmark evidence
When used in code
Then it must remain behind an interface and status candidate
```


See also: [architectural-constitution.md](architectural-constitution.md), [system-identity.md](system-identity.md), [layered-architecture.md](../01-system-architecture/layered-architecture.md).
