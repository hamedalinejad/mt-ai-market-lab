---
id: DOC-PROJ-030
title: Core Principles — Single Constitution
status: approved
version: 1.0
phase: 0
domain: 00-project
updated: 2026-09-04
---

# Core Principles (B-001 — one constitution)

This is the **only** normative principles set. Other docs must not invent competing “four principles” lists.

1. **Documentation First** — no production code before approved contracts for that slice  
2. **Data First** — quality data before intelligence claims  
3. **Discovery ≠ Truth** — candidates need independent evidence  
4. **Prediction ≠ Decision** — signals/strategies are not orders  
5. **Learning ≠ Blind Update** — versioned, gated, reversible updates  
6. **Correlation ≠ Causation** — causal claims need explicit assumptions  
7. **Explainability & Trace** — material signals carry evidence  
8. **Controlled Automation** — Risk veto, Safe Mode, no autonomous escalation without gates  
9. **Separation of Concerns** — planes and roles (Predictor/Learner/Discoverer)  
10. **Fail-safe default** — on uncertainty, deny/halt rather than trade  

Supersedes any fragmented principle lists in older drafts.

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

