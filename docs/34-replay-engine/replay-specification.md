---
id: DOC-REPLAY-001
title: Replay Engine Specification
status: draft
version: 0.2
phase: 0
domain: 34-replay-engine
---

# Replay Engine

## Capabilities
- event ordering (deterministic)
- logical clock
- deterministic seed
- tick replay / bar replay
- order simulator (reject, requote, partial fill)
- latency, spread, slippage models (versioned cost bundle)
- checkpoint, pause/resume
- same dataset+config+model+seed → same result

## Non-goals
Replace Live MT5 networking; paper path must still share Risk/Signal contracts.
