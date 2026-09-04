---
depends_on: ['DOC-CONTRACT-DATA-time', 'DOC-CONTRACT-DATA-identity']
id: DOC-CONTRACT-DATA-tick
title: Data Contract — Tick
status: approved
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


## Domain Acceptance Criteria

```text
AC-TICK-01
Given a tick with bid=1.10 and ask=1.09
When quality gate runs
Then quality_status must not be ok (ask < bid)

AC-TICK-02
Given two ticks with same logical identity
When canonical upsert runs
Then exactly one canonical row remains (dedupe)

AC-TICK-03
Given event_time_utc > ingestion_time_utc
When validation runs
Then the batch is quarantined or rejected
```
