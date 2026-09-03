---
id: DOC-CONTRACT-IF-signal
title: Interface — signal
status: reviewed
version: 0.6
phase: 0
domain: contracts
updated: 2026-09-03
---

# Interface: signal

## Methods
| Method | Input | Output | Errors |
|--------|-------|--------|--------|
| `propose` | inputs | Signal | InvalidTrace |
| `confirm/expire/resolve/fail` | signal_id | Signal | NotFound |

## Retry behavior
n/a for propose pure

## Idempotency
dedupe fingerprint

## Timeout
—

## Concurrency
per instrument ordering

## Transaction boundary
status transitions explicit

## Observability
SIGNAL_CREATED

## Cancellation
—

## Versioning
signal schema_version

## Test double
RecordingSignalEngine
