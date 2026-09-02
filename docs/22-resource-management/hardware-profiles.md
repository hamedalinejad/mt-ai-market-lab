---
id: DOC-RES-002
title: Hardware Profiles
status: draft
version: 0.2
phase: 0
domain: 22-resource-management
created: 2026-09-01
updated: 2026-09-02
depends_on: [DOC-RES-001]
related: [DOC-RES-009, DOC-RES-010]
---

# Hardware Profiles

## Purpose

Bind “Lightweight” to **measurable targets**. Numbers are **placeholders until Benchmark**; they must not be guessed into Architecture Truth.

## Profiles

| Profile | Intent |
|---------|--------|
| **Laptop Mode** | Default daily use on a typical laptop |
| **Standard Mode** | Comfortable headroom on the same class of machine |
| **High Performance Mode** | Optional; may use more CPU/RAM or external GPU |
| **Research Mode** | Heavy Discovery/Training allowed; must not share process with Live |
| **Emergency Low Resource Mode** | Protect Live + Data Integrity; shed all else |

## Numeric Target Template (fill after Benchmark)

```text
Idle RAM            < X GB
Live inference      < X ms
CPU average (live)  < X %
Training RAM        < X GB
Disk budget         < X GB
Max model size      < X MB
Max feature count   < N
Max concurrent symbols < N
Training time target   < X min per standard job
Inference time target  < X ms per symbol batch
GPU                 optional
```

## Rules

- Numbers are **measured**, not invented.
- Profile selection is configuration; Emergency mode is automatic on threshold breach.
