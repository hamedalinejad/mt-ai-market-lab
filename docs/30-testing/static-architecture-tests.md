---
id: DOC-TEST-005
title: Static Architecture Tests
status: reviewed
version: 0.4
phase: 0
domain: 30-testing
updated: 2026-09-04
---

# Executable Static Gates (BUG-TEST-P0-002)

1. No unauthorized MetaTrader5 import  
2. No data domain direct broker calls outside adapter  
3. No model direct storage access  
4. No production model promotion without validation  
5. No live trading in research mode  
6. No feature access beyond availability time  
7. No random shuffle in temporal promotable tests  
8. No cursor advance before publish  
9. No duplicate canonical identity  
10. No schema mismatch without explicit migration  
