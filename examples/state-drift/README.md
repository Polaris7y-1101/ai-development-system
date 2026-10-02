# Demo D3 — state-drift（Recorded ≠ Reality）

## What this demonstrates
三类漂移的 **detect → classify → stop → reconcile**，及 Unknown Dirty Worktree 的保护性冻结（no reset / no clean / no overwrite）。

## Steps
```bash
cd examples/state-drift && ./run_demo.sh
```
确定性构造三案例：A 记录 HEAD ≠ 实际 HEAD；B 记录分支 ≠ 实际分支；C 工作区未知脏改。
检测器（scenario/detect_drift.py）逐一分类并输出处置；C 案例验证脏文件前后 hash 不变（preserve 证明）。

## Expected result
`expected/output.txt`：`DETECTED HEAD_MISMATCH → STOP+RECONCILE` ×2 + `DETECTED UNKNOWN_DIRTY_WORKTREE → PRESERVED(no reset/clean/overwrite)` + `preserved_sha_equal=true`。

## Rules tested
STATE_DRIFT 三型分类；漂移先停后对账；未知变更保护性保留。
