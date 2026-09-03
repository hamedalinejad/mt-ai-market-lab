---
id: DOC-CONTRACT-DATA-tick
title: Data Contract — Tick
status: reviewed
version: 0.7
phase: 0
domain: contracts
---

# Tick

## Purpose
First-class tick stream for spread/microstructure/execution.

## Identity
Logical: `(instrument_id, event_time_utc, sequence|source_event_id)`  
Source: `(source, source_symbol, source_timestamp, source_sequence|event_id)`

## Required
event_time_utc, ingestion_time_utc, instrument_id, source, quality_status, ingestion_batch_id; at least one of bid/ask/last

## Optional
bid, ask, last, volume, volume_type, flags, source_event_id, sequence, source_timestamp, source_timezone, availability_time_utc, processing_time_utc

## Types / Units / Timezone
UTC instants; prices per instrument digits policy.

## Validity / Provenance / Version / Nullability
quality_status gates use; source retained; schema_version on batch.

## Invariants
ask>=bid when both set; event_time_utc <= availability_time_utc <= ingestion_time_utc when set.

## Examples
Valid: consistent bid/ask. Invalid: ask<bid with quality=ok.

## Compatibility policy
Additive optional fields minor; identity change major.
