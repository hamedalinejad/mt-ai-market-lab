#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../../.." && pwd)"
cd "$ROOT"
fail=0

# Gate: contracts tree
if [[ -x docs/30-testing/scripts/check_contracts_tree.sh ]]; then
  bash docs/30-testing/scripts/check_contracts_tree.sh || fail=1
else
  echo "WARN: check_contracts_tree.sh missing"
fi

# Gate: no MetaTrader5 import outside allowed paths (when src exists)
if [[ -d src ]]; then
  if grep -RIn --include='*.py' -E 'import MetaTrader5|from MetaTrader5' src 2>/dev/null | grep -v 'adapter' | grep -v 'mt5' ; then
    echo "FAIL: MetaTrader5 import outside adapter-like paths"
    fail=1
  fi
fi

# Gate: vertical slice docs approved
for f in \
  docs/contracts/data/tick.md \
  docs/contracts/data/candle.md \
  docs/contracts/data/time-fields.md \
  docs/contracts/interfaces/market-data-provider.md \
  docs/05-synchronization/cursor-safety.md \
  docs/18-risk-engine/risk-architecture.md \
  docs/21-runtime-modes/safe-mode.md
 do
  if ! grep -q '^status: approved' "$f"; then
    echo "FAIL: $f not approved"
    fail=1
  fi
 done

# Gate: DDL + JSON schema exist
[[ -f docs/contracts/schemas/ddl/control_plane_v001.sql ]] || { echo "FAIL: DDL missing"; fail=1; }
[[ -f docs/contracts/schemas/json/event-envelope.schema.json ]] || { echo "FAIL: event schema missing"; fail=1; }

exit $fail
