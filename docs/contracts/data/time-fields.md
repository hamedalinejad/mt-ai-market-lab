---
id: DOC-CONTRACT-DATA-time
title: Time Semantics — Final Contract
status: approved
version: 1.0
phase: 0
domain: contracts
created: 2026-09-04
updated: 2026-09-04
depends_on: ['DOC-PROJ-052']
---

# Time Semantics

## Canonical clock
Internal reasoning uses **UTC**. Source-local time retained for provenance/session interpretation.

## Fields
```text
source_timestamp, source_timezone
event_time_utc / market_time
availability_time_utc
ingestion_time_utc
processing_time_utc
```

## Candle
```text
open_time_utc, close_time_utc
CANDLE_CLOSED ⇒ close_time_utc > open_time_utc
```
Partial/current candles marked explicitly; must not leak into closed-bar decisions.

## Availability-time safety
Backtests use availability semantics of the original decision point, not market timestamp alone.

## Forbidden lookahead (examples)
- HTF close before HTF is closed
- revised candle value at earlier decision
- normalization using future observations
- cross-market join without availability alignment
- label horizon overlap without embargo/purge

## Acceptance Criteria

```text
AC-TIME-01
Given decision_point requires closed bar
When feature uses CANDLE_PARTIAL
Then validation fails for promotable path

AC-TIME-02
Given availability_time_utc > decision time T
When used in feature at T
Then the sample is invalid for that decision
```
