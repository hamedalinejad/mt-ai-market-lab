---
id: DOC-DATA-015
title: Instrument Model
status: draft
version: 0.2
phase: 0
domain: 03-market-data
created: 2026-09-01
updated: 2026-09-01
depends_on: [DOC-DATA-001]
related: [DOC-DATA-021, DOC-MT5-014, DOC-DATA-002]
---

# Instrument Model

## Purpose

Define the internal **Instrument** as a rich metadata object — not a bare symbol string.

## Identity

```text
instrument_id   # stable internal UUID/ulid
```

Broker symbol names are **attributes**, not primary keys (same logical market may appear as `EURUSD`, `EURUSDm`, … across brokers).

## Core Fields

| Field | Required | Description |
|-------|----------|-------------|
| instrument_id | yes | Internal stable id |
| broker | yes | Broker / company key |
| server | no | Trade server name if known |
| name | yes | Broker-visible symbol name |
| canonical_name | yes | Normalized name for cross-broker logic (policy-defined) |
| asset_class | yes | forex \| crypto \| index \| commodity \| cfd \| other |
| base_asset / base_currency | yes when applicable | |
| quote_asset / quote_currency | yes when applicable | |
| margin_currency | no | |
| digits | yes | Price digits |
| point | yes | Point size |
| tick_size | yes | Minimal price change |
| tick_value | no | Value per tick in deposit/margin currency when known |
| contract_size | yes when applicable | |
| price_precision | yes | Same or derived from digits |
| volume_precision | yes | |
| volume_min / volume_max / volume_step | yes for tradeable | |
| trade_mode | no | MT5 trade mode enum mapped |
| execution_mode | no | |
| swap_mode / swap_long / swap_short | no | |
| spread_mode | no | |
| session_definition | yes | Reference to session calendar |
| timezone | yes | Broker/symbol timezone policy ref |
| metadata_version | yes | Increments on material metadata change |
| source | yes | mt5 \| manual \| import |
| active | yes | Whether selected for lab pipelines |

## MT5 Mapping

When source is MT5, fields are populated primarily from `symbol_info` (and related) and **snapshotted** into metadata storage. Raw MT5 property bags may be stored under `metadata_json` for audit without becoming the canonical interface.

## Rules

- Analysis/AI code uses `instrument_id`, not raw broker strings.
- Changing `digits` / `contract_size` requires `metadata_version` bump and impact review on stored prices.
- Asset class detection may use metadata + heuristics; name-only classification is insufficient.

## Open Questions

- Canonical_name algorithm for broker suffixes (`m`, `.pro`, …)
- Multi-server same broker handling
