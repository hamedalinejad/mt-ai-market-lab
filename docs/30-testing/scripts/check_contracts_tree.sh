#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../../.." && pwd)"
miss=0
for p in docs/contracts/data docs/contracts/events; do
  [[ -d "$ROOT/$p" ]] || { echo "MISSING $p"; miss=1; }
done
[[ -f "$ROOT/docs/contracts/data/tick.md" ]] || { echo "MISSING tick"; miss=1; }
[[ -f "$ROOT/docs/contracts/data/time-fields.md" ]] || { echo "MISSING time-fields"; miss=1; }
exit $miss
