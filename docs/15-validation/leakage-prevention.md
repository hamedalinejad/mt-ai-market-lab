---
id: DOC-VAL-013
title: Leakage Prevention
status: draft
version: 0.2
phase: 0
domain: 15-validation
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-VAL-022, DOC-DATA-001]
related:
  - DOC-VAL-016
  - DOC-VAL-024
  - DOC-VAL-014
  - DOC-FEAT-001
  - DOC-PRED-001
  - DOC-SYNC-009
---

# Leakage Prevention

## Purpose

Leakage Prevention is a **hard safety boundary** of the laboratory.

Any analysis, training, discovery, ranking, selection, calibration, or promotion that uses information not strictly available at the decision timestamp is **invalid**, even if metrics look strong.

This document is independent and deep: it enumerates forbidden leakage modes, required temporal contracts, and acceptance tests.

## Scope

Applies to:

- Feature computation
- Indicator computation
- Regime labeling
- Model training and online updates
- Hyperparameter search
- Experiment design and evaluation
- Signal generation and ranking
- Strategy backtests and paper trading evaluation
- Cross-symbol and cross-timeframe joins

Does **not** forbid:

- Pure offline research that explicitly marks look-ahead for exploration only
- Diagnostic tools that are **not** allowed to promote Candidates

Any look-ahead research artifact must be labeled `non_promotable` and excluded from Knowledge promotion paths.

## Core Temporal Contract

For any artifact produced at time `t` (prediction, signal, feature used for decision, regime label used for routing):

```text
available_information(artifact, t)
  ⊆ information_strictly_known_at(t)
```

More precisely for bar-based systems:

- Decision at bar open `t` may use only data whose **availability time** ≤ `t` (or ≤ previous close, depending on the declared decision point).
- Decision at bar close `t` may use only data available at close of `t`, never bars with open > `t`.

Every model, feature, and experiment **must declare its decision point**:

```text
decision_point ∈ { bar_open, bar_close, tick_time }
availability_lag ≥ 0
```

Undeclared decision point ⇒ invalid artifact.

---

## Forbidden Leakage Modes

### 1. Future candle leakage

Forbidden:

- Using candle `t+k` (k>0) to compute a feature or label input for a decision at `t`
- Using the high/low/close of the **current** bar for a decision declared at **bar open**
- Label windows that overlap decision features without causal lag

Required:

- Explicit `availability_time` for every feature value
- Decision at bar open `t` uses only candles with open time ≤ previous bar or strictly available before `t`

### 2. Future indicator leakage

Forbidden:

- Indicators that internally use centered windows spanning future bars
- Any indicator value at `t` whose formula depends on prices after the declared decision point
- Using “final” indicator values from charting tools that repaint

Required:

- Causal indicator implementations only (backward-looking windows)
- Indicator values must be reproducible from a pure historical prefix

### 3. Centered rolling

Forbidden for promotable features:

- Centered moving averages
- Centered rolling z-scores
- Any window with `look_ahead > 0`

Allowed only for:

- Non-promotable diagnostics
- Visualization clearly marked as non-causal

### 4. Future normalization

Forbidden:

- Normalizing a feature at `t` using mean/std computed on a window that includes times > availability time of the decision
- Global normalization over the full sample (train+test) for promotable models
- Min-max scaling over the entire backtest span

Required:

- Normalization statistics fitted only on data available at or before the fit cutoff
- Online or expanding/causal rolling normalization for live path

### 5. Future feature selection

Forbidden:

- Selecting features using test-set performance
- Selecting features using full-sample correlation with future returns, then evaluating on the same sample
- Freezing a feature set after peeking at holdout

Required:

- Feature selection only on train or inner-CV folds
- Holdout used once for final report (or nested outer loop)

### 6. Future regime labeling

Forbidden:

- Labeling regime at `t` using future price path after `t`
- Using “final” regime segmentation from an offline algorithm that sees the whole series, then applying those labels in causal decision simulation

Required:

- Causal regime detectors (filter, not smoother that looks ahead)
- Or offline regime labels only for non-promotable analysis, never for Signal backtest that claims deployability

### 7. Survivorship bias

Forbidden:

- Building a universe of only symbols that still exist at the end of the sample
- Ignoring delisted / renamed / halted instruments when evaluating historical portfolio rules

Required:

- Point-in-time universe membership when evaluating multi-symbol strategies
- Explicit handling of symbol lifetime in Instrument metadata

### 8. Look-ahead bias

Forbidden:

- Using information with availability time > decision time
- Using revised prints as if they were known on the event day without lag

Required:

- Every feature declares `decision_point` and `availability_lag`
- Simulation respects availability time

### 9. Revised source data

Forbidden:

- Treating revised historical data as if it were the original live print

Required:

- Provenance: revision flag when imports replace prior history
- Prefer point-in-time data when available; otherwise document revision risk

### 10. Overlapping labels

Forbidden:

- Labels that overlap in time such that the same future period is counted multiple times as independent samples without correction
- Horizons that leak into the next sample’s features without embargo

Required:

- Embargo / purge between train and test when labels span horizons
- Explicit horizon and label span in Prediction/Experiment contracts

### 11. Train/test contamination

Forbidden:

- Shuffling time series as i.i.d. rows for promotable models
- Standard CV that ignores temporal order for temporal Claims

Required:

- Time-based splits
- Purge/embargo for overlapping label horizons

### 12. Hyperparameter leakage

Forbidden:

- Tuning hyperparameters on the same holdout used for final report
- Repeated peeking at test metrics to choose model

Required:

- Inner loop for HPO; outer holdout once (or nested outer WF)

### 13. Experiment leakage

Forbidden:

- Choosing which experiment “counts” after seeing all outcomes on the same test set
- Selective reporting without registry of all runs

Required:

- All experiments registered before or at run time
- Full run log retained (including failures)

### 14. Cross-symbol leakage

Forbidden:

- Using future values of symbol B to decide on symbol A at time t when those values were not available
- Building cross-sectional features with contemporaneous future prints

Required:

- Availability time per symbol
- Causal cross-sectional snapshots only

### 15. Cross-timeframe leakage

Forbidden:

- Using a higher-TF bar that has not closed yet as if it were complete
- Using completed higher-TF indicator values before the higher TF bar close

Required:

- Higher-TF features declare whether they use last **closed** higher-TF bar only
- Decision point must be consistent across TFs

## Acceptance Tests for Leakage Discipline

- Replay test: feature values at `t` depend only on data with availability ≤ decision point
- Recompute test: given prefix history, features match stored feature_snapshot_id
- Split test: no random shuffle CV for promotable temporal claims
