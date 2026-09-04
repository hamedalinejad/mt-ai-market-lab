---
id: DOC-STOR-014
title: Storage Architecture
status: approved
version: 1.0
phase: 0
domain: 04-storage
created: 2026-09-04
updated: 2026-09-04
depends_on: ['DOC-PROJ-050']
---

# Storage Architecture

## Directory contract (logical)

```text
data/
  raw/<source>/<broker>/<instrument>/<timeframe>/
  canonical/symbol=<SYMBOL>/timeframe=<TF>/year=<YYYY>/month=<MM>/part-*.parquet
  derived/ features/ labels/ experiments/ replay/ quarantine/ archive/
state/
  market_lab.sqlite
  backups/
models/ knowledge/ logs/ artifacts/
```

Names may vary only via a binding storage-layout decision.

## Immutability
Raw: append-oriented audit evidence. Canonical: atomic publish. Never mutate a file a live reader may scan.

## Write protocol
```text
receive → stage → validate → deduplicate → write immutable part
  → checksum → publish manifest atomically → advance sync cursor transactionally
```

## Live Parquet
No indefinite in-place append to a single `live.parquet`. Use immutable time-bounded parts + controlled compaction.
