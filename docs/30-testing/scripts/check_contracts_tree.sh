#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../../.." && pwd)"
miss=0
for p in docs/contracts/data docs/contracts/events docs/contracts/interfaces docs/contracts/schemas docs/contracts/errors; do
  if [[ ! -d "$ROOT/$p" ]]; then echo "MISSING DIR $p"; miss=1; fi
done
required_data=(tick quote candle instrument timeframe market-session feature feature-snapshot label prediction discovery-candidate experiment knowledge signal strategy risk-decision order-intent broker-order execution position account-state outcome failure dataset-snapshot)
for f in "${required_data[@]}"; do
  if [[ ! -f "$ROOT/docs/contracts/data/$f.md" ]]; then echo "MISSING DATA $f"; miss=1; fi
done
for f in event-envelope.md event-catalog.md data-events.md sync-events.md model-events.md discovery-events.md signal-events.md risk-events.md execution-events.md system-events.md; do
  if [[ ! -f "$ROOT/docs/contracts/events/$f" ]]; then echo "MISSING EVENT $f"; miss=1; fi
done
if [[ ! -f "$ROOT/docs/contracts/README.md" ]]; then echo "MISSING README"; miss=1; fi
if ! grep -q 'data/' "$ROOT/docs/contracts/README.md"; then echo "README missing data mention"; miss=1; fi
if ! grep -q 'events/' "$ROOT/docs/contracts/README.md"; then echo "README missing events mention"; miss=1; fi
if [[ $miss -eq 0 ]]; then echo "TREE_OK"; fi
exit $miss
