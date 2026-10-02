# Demo D2 — cross-ai-handoff（Runtime A → Runtime B）

## What this demonstrates
Runtime A（任意，如 Hermes）写 handoff → Runtime B（任意，如 Claude Code）**不读 A 的聊天记录**，仅凭：
CURRENT_HANDOFF + CURRENT_TASK + Git Reality 三源即可继续任务。

## Steps
```bash
cd examples/cross-ai-handoff && ./run_demo.sh
```
脚本确定性模拟：A checkpoint（记录 task/branch/HEAD/scope）→ handoff 文件 → B 启动 →
读取 handoff → 独立 `git rev-parse`/`branch`/`status` 复核 → 三源一致 → continue → 不一致则 STOP（HANDOFF_STALE）。

## Expected result
`expected/output.txt`：`RESUME_OK same_task same_branch same_worktree git_reality_checked`；篡改分支后 `STOP: HANDOFF_STALE`。

## Rules tested
handoff = claim to verify（不是信任凭证）；Git Reality 独立复核；chat history 零依赖。
只需 1 个 git 环境 + 任意两个 AI runtime 的等价物即可理解，不要求三 runtime。
