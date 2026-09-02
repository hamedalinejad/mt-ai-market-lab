---
id: DOC-DISC-022
title: Expression Tree
status: reviewed
version: 0.2
phase: 0
domain: 13-discovery-engine
---

# Expression Tree (AST)

Every Discovery Candidate stores:

```text
expression          # serialized form
operators[]
inputs[]
parameters{}
depth
node_count
complexity          # policy score from depth/nodes/ops
ast                 # structured tree (binding for equivalence)
```

Opaque weight blobs alone are insufficient for formula discovery claims.
