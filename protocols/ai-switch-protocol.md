# AI_SWITCH_PROTOCOL — 跨 AI 接力协议（通用）

> 位置: `<runtime-home>/legion/protocols/ai-switch-protocol.md`
> 原则: **AI 可替换，项目记忆不可丢。** 任何 AI 不得要求上一 AI 的完整聊天历史才能继续工作。

---

## 参与者

- 切出方（当前 AI/Runtime）：`session-checkpoint`
- 切入方（新 AI/Runtime）：`session-resume`
- 适用：Hermes ↔ Codex Desktop ↔ Claude Code ↔ 其他 Coding Agent

---

## 协议

```
【切出】session-checkpoint
  1 确认 Canonical Repo
  2 读 CURRENT_TASK
  3 git status / branch / HEAD
  4 检查未提交修改
  5 跑必要测试
  6 更新 CURRENT_TASK.md
  7 更新 PROJECT_STATE.md
  8 生成 CURRENT_HANDOFF.md（旧文件 → archive）
  9 符合规则则建本地 checkpoint commit（禁 push）
 10 输出 SWITCH READY
        │
        ▼   （项目文件 + Git 即为交接载体）
【切入】session-resume
  1 确认 Canonical Repo
  2 读 AGENTS.md
  3 读 PROJECT_RULES.md
  4 读 PROJECT_STATE.md
  5 读 CURRENT_TASK.md
  6 读 CURRENT_HANDOFF.md
  7 git status / branch / HEAD
  8 git log -10
  9 repo-reality-check
 10 比较 Handoff vs Git
 11 输出 RESUME SUMMARY
```

---

## 冲突裁决

```
Handoff ≠ Git  →  以「真实源码 / Git 状态」为准  →  标记 STATE_DRIFT  →  不得直接编码
```

---

## 启动约束（所有 Coding Agent / Runtime 通用）

无论 Hermes / Claude Code / Codex / 未来 Runtime，**接手已有项目时**必须：
1. 先执行 `session-resume`
2. 至少读取：`AGENTS` · `PROJECT_CONTEXT` · `PROJECT_STATE` · `CURRENT_TASK` · 相关 `ADR` · `Git Reality`

**开始新 Task 时**至少读取：`AGENTS` · `PROJECT_CONTEXT` · `PROJECT_STATE` · `CURRENT_TASK` · 相关 ADR · Git Reality。

执行开发前必须确认：

- [ ] `PROJECT_STATE.md` 已读
- [ ] `CURRENT_TASK.md` 已读
- [ ] `handoffs/CURRENT_HANDOFF.md` 已读（如存在）
- [ ] `PROJECT_CONTEXT.md` 已读
- [ ] 相关 ADR 已读
- [ ] Git 状态已核实（`git status` / `branch` / `HEAD`）
- [ ] 当前 Worktree 正确
- [ ] 当前 HEAD 正确

**禁止仅凭聊天上下文继续旧任务。**

---

## Worktree 归属不变式（MIG-002）

AI 接力（Hermes ↔ Codex ↔ Claude Code ↔ 任何 Runtime）**不改变 Worktree 归属**：

```text
AI Switch / Runtime Switch / Model Switch / Provider Switch ≠ New Worktree
同一 Implementation Task = same Task + same Task Branch + same Task Worktree
```

- 切入方 `session-resume` 的第 7 步「Git 状态核实」若发现当前 Worktree 与 CURRENT_TASK 归属一致 → **直接复用**，禁止为"换了个 AI"另建新树。
- 复用判定与安全边界见权威定义：`git-worktree-manager` skill（Ownership 节 + UNKNOWN_WORKTREE_CHANGES 冻结 + prunable 跨环境四查）。
- Handoff 中的 Worktree 信息是 **Claim to Verify**（对 Git Reality 验证），不是创建/删除依据；Task 归属以 `CURRENT_TASK` 为准。

---

## 禁止

- ❌ 要求上一 AI 的完整聊天历史才能继续
- ❌ 切出时忽略未提交高风险修改
- ❌ 测试失败时假装 SWITCH READY
- ❌ 切入时在 STATE_DRIFT 未澄清前编码
- ❌ 自动 push / merge 主分支
