---
id: DOC-OBS-LOG
title: Logging Standard
status: reviewed
version: 0.2
phase: 0
---

# Logging (REQ-TECH-006)

- Levels: DEBUG, INFO, WARNING, ERROR, CRITICAL  
- Format: structured JSON preferred for machine logs  
- Fields: timestamp_utc, level, component, event_type?, correlation_id?, message  
- Rotation + retention policy versioned  
- Candidate libs: structlog / loguru (not locked)
