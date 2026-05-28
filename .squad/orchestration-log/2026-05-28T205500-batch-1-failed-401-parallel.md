# Orchestration Log — Failed Batch 1 (Parallel Spawn Outage)

**Batch ID:** linus-1, linus-2 (CSS fix attempts)  
**Start Time:** 2026-05-28 early batch  
**Status:** ❌ Failed — Platform 401 Outage

## Error Summary
Both agents died with:
```
CAPIError: 401 unauthorized: db-mysql-github-ro.service.github.net: missing port
```

## Root Cause
Platform-level database access issue on GitHub backend (`db-mysql-github-ro.service.github.net`). Occurred during early CSS fix attempts when agents attempted to read protected resources.

## Workaround Discovered
**Serial dispatch succeeds where parallel fails.** After discovering this pattern, subsequent agent spawns were dispatched one at a time instead of in parallel batches. This eliminated the 401 race.

## Recovery Action
Restarted CSS fix work with linus-3 (serial). **✅ Succeeded.**

## Notes
- Do not spawn multiple agents in parallel during high-load periods
- Recommend staggering agent spawns by 30–60 seconds
- If 401 occurs, check platform status and retry serially
