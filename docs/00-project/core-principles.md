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


<!-- merged from docs/00-project/principles.md -->

# Principles

## 3.1 Documentation First

No production code is written before the corresponding Specification is approved.

## 3.2 Data First

No analysis or learning is valid without healthy, traceable, reproducible data.

## 3.3 Discovery ≠ Truth

Everything Discovery finds is only a `Candidate`.

## 3.4 Prediction ≠ Decision

Prediction is only a probabilistic estimate of the future and by itself does not authorize a Signal or Order.

## 3.5 Learning ≠ Blind Update

An Error does not automatically change a model.

## 3.6 Correlation ≠ Causation

Correlation can only create a Hypothesis; claiming causation requires separate tests.

## 3.7 Validation Before Promotion

No model, Feature, Discovery, Signal or Strategy is promoted without appropriate Gates.

## 3.8 Reversible Intelligence

Every Model and Knowledge object is versionable and roll-backable.

## 3.9 Explainability by Trace

Every important Signal, Prediction, Experiment and Promotion must have Evidence and Trace.

## 3.10 Lightweight First

The system is designed for a normal laptop and must be able to reduce low-priority workloads under resource pressure.

## 3.11 Separation of Concerns

Data, Representation, Analysis, AI, Discovery, Validation, Knowledge, Signal, Strategy, Risk and Execution are independent and contractual.

## 3.12 Controlled Automation

Real automation is staged; no fresh Candidate is allowed to send Orders directly.

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

