---
id: ADR-0008
title: MT5 Integration Boundary
status: accepted
version: 0.2
phase: 0
domain: decisions
created: 2026-09-01
updated: 2026-09-02
related: [DOC-CONTRACT-IF-001, DOC-MT5-009]
---

# ADR-0008: MT5 Integration Boundary

## Decision

All MetaTrader 5 access goes through **MT5Adapter** implementing **MarketDataProvider** (and related control interfaces). Downstream domains use Canonical schemas only.

## Consequences

- Testability via FakeMarketDataProvider / ReplayProvider
- AI, Discovery, Prediction remain source-agnostic
- External sources share the same provider interface family
