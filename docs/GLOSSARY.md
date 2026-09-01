---
id: DOC-0004
title: Glossary
status: draft
version: 0.1
phase: 0
domain: docs
created: 2026-09-01
updated: 2026-09-01
depends_on: []
related: [DOC-0001]
---

# Glossary

## Core Terms

| Term | Definition |
|------|------------|
| **Candidate** | Any Discovery, Feature, Formula, Pattern, Signal or Strategy that has not yet passed Validation Gates. Not Truth. |
| **Discovery** | Process or result of searching for previously unknown structures, relationships or formulas. Always produces Candidates. |
| **Prediction** | Probabilistic estimate of future market quantities (direction, return, range, volatility, etc.). Does not authorize orders by itself. |
| **Signal** | Actionable, traceable recommendation derived from validated Evidence and Knowledge. |
| **Knowledge** | Versioned, lifecycle-managed artifact that has passed Validation and can be referenced by Signals/Strategies. |
| **Market DNA** | Compact behavioral fingerprint of an Instrument used for similarity, routing and clustering. Representation only, not Truth. |
| **Specialist** | Lightweight model focused on a particular regime or behavior (Trend, Range, Volatility, etc.). |
| **Trace** | Evidence package explaining why a Signal, Prediction or Promotion was produced. |
| **Validation Gate** | Artifact-specific criteria that must be satisfied before Promotion. |
| **Promotion** | Controlled transition of a Candidate into Active Knowledge / Strategy after Validation. |
| **Error / Failure Memory** | Structured record of past mistakes usable as negative evidence in similar contexts. |
| **Kill Switch** | Multi-level safety mechanism (manual/automatic) that can halt trading activity. |
| **Paper Trading** | Simulated execution against real market data with realistic costs and slippage. |
| **Controlled Automation** | Staged automation that never allows a fresh Candidate to send live orders directly. |

## Principles (short)

- Discovery ≠ Truth
- Prediction ≠ Decision
- Learning ≠ Blind Update
- Correlation ≠ Causation
