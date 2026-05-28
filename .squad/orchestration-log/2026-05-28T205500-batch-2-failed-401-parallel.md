# Orchestration Log — Failed Batch 2 (Parallel Spawn Outage)

**Batch ID:** rusty-1, rusty-2, basher-1, basher-2 (early audit spawns)  
**Start Time:** 2026-05-28 early batch  
**Status:** ❌ Failed — Platform 401 Outage (4 agents)

## Error Summary
All four agents died with same error as batch 1:
```
CAPIError: 401 unauthorized: db-mysql-github-ro.service.github.net: missing port
```

## Root Cause
Same platform-level database access issue. Occurred when attempting to spawn 3+ agents in parallel during audit work.

## Pattern Identified
- **Parallel spawns (3+) = 401 failures** — Concurrent database access attempts trigger auth/rate-limit failures
- **Serial spawns (1 at a time) = Success** — Staggered dispatch avoids race condition

## Workaround Applied
All subsequent spawns (rusty-3, basher-3, rusty-4, basher-4) were dispatched serially.

## Recovery Actions
- **rusty-1 / rusty-2** → Restarted as **rusty-3** (serial) — ✅ Succeeded
- **basher-1 / basher-2** → Restarted as **basher-3** & **basher-4** (serial) — ✅ Succeeded

## Recommendation
- Do not spawn 3+ agents in parallel during typical operations
- Use serial dispatch (one agent at a time) as default strategy
- Only attempt parallel if platform shows no active incidents
