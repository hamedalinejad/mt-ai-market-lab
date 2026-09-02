---
id: DOC-AI-015
title: Model Registry
status: reviewed
version: 0.3
phase: 0
domain: 10-ai-core
---

# Model Registry (binding fields)

```text
model_id
version
parent_model
status
artifact_uri
dataset_snapshot
feature_version
config_version
training_run
validation_run
metrics
created_at
promoted_at
retired_at
```

## API
list_models, get_active_model (champion), promote, rollback, retire, compare
