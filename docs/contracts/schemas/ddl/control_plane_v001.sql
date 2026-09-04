-- control_plane_v001.sql — SQLite DDL target (Phase 0 approved for vertical slice)
PRAGMA journal_mode=WAL;

CREATE TABLE IF NOT EXISTS instrument (
  instrument_id TEXT PRIMARY KEY,
  broker_id TEXT NOT NULL,
  server_id TEXT,
  broker_symbol TEXT NOT NULL,
  canonical_name TEXT NOT NULL,
  metadata_version INTEGER NOT NULL DEFAULT 1,
  active INTEGER NOT NULL DEFAULT 1
);

CREATE TABLE IF NOT EXISTS sync_state (
  instrument_id TEXT NOT NULL,
  timeframe TEXT NOT NULL,
  source TEXT NOT NULL,
  last_seen TEXT,
  last_persisted TEXT,
  first_available TEXT,
  expected_next TEXT,
  status TEXT NOT NULL,
  gap_count INTEGER NOT NULL DEFAULT 0,
  last_error TEXT,
  policy_versions TEXT,
  updated_at TEXT NOT NULL,
  PRIMARY KEY (instrument_id, timeframe, source)
);

CREATE TABLE IF NOT EXISTS gap (
  gap_id TEXT PRIMARY KEY,
  instrument_id TEXT NOT NULL,
  timeframe TEXT NOT NULL,
  source TEXT NOT NULL,
  expected_start TEXT,
  expected_end TEXT,
  actual_start TEXT,
  actual_end TEXT,
  gap_class TEXT NOT NULL,
  confidence REAL,
  first_detected_at TEXT NOT NULL,
  resolved_at TEXT,
  evidence_ref TEXT
);

CREATE TABLE IF NOT EXISTS order_intent (
  intent_id TEXT PRIMARY KEY,
  client_order_id TEXT NOT NULL UNIQUE,
  broker_ticket TEXT,
  signal_id TEXT,
  strategy_id TEXT,
  risk_decision_id TEXT,
  instrument_id TEXT NOT NULL,
  side TEXT NOT NULL,
  size REAL NOT NULL,
  execution_state TEXT NOT NULL,
  created_at TEXT NOT NULL,
  expires_at TEXT
);

CREATE TABLE IF NOT EXISTS event_log (
  event_id TEXT PRIMARY KEY,
  event_type TEXT NOT NULL,
  occurred_at_utc TEXT NOT NULL,
  producer TEXT,
  payload_json TEXT,
  correlation_id TEXT
);

CREATE TABLE IF NOT EXISTS migration_metadata (
  name TEXT PRIMARY KEY,
  checksum TEXT NOT NULL,
  applied_at TEXT NOT NULL,
  author TEXT,
  status TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS model_registry (
  model_version TEXT PRIMARY KEY,
  model_id TEXT NOT NULL,
  status TEXT NOT NULL,
  dataset_snapshot_id TEXT,
  feature_set_id TEXT,
  artifact_uri TEXT,
  created_at TEXT NOT NULL
);
