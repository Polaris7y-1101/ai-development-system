# Project Memory（项目记忆）

> **AI runtimes are replaceable. Project memory is not.**
> 运行时可换，项目记忆不可丢。

## 分层

| 层 | 文件 | 寿命 | 作用 |
|---|---|---|---|
| L0 | 会话上下文（各 runtime 私有） | 单次会话 | 可丢弃 |
| L1 | `CURRENT_TASK.md` | 任务期 | 当前任务唯一权威（目标/范围/状态） |
| L1 | `handoffs/CURRENT_HANDOFF.md` | 交接期 | 跨 AI 交接主张（待核验） |
| L2 | `PROJECT_STATE.md` | 项目期 | 阶段/分支/worktree/最近验证 HEAD |
| L3 | `memory/PROJECT_MEMORY.md` | 项目期 | 长期事实与约定 |
| L3 | `memory/LESSONS.md` | 永久 | 已验证工程教训（四步链：观察→确认根因→验证解法→预防规则） |
| L3 | `docs/decisions/ADR-*.md` | 永久 | 架构决策记录 |
| — | Git Reality（branch/HEAD/status） | 实时 | 唯一物理现实，一切记录以此对账 |

## 规则
- 六件套是**唯一**工程事实源；禁止任何 runtime 专属副本（如 *_PROJECT_STATE）
- Handoff 是主张不是凭证：接手方必须独立 `git` 复核
- 状态漂移（记录≠现实）→ 停止盲执行 → 对账后更新记录
