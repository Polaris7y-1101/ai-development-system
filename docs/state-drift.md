# STATE_DRIFT（状态漂移）

## 是什么
**记录的状态 ≠ 仓库的现实**。例如 CURRENT_HANDOFF 说 HEAD=a1b2c3d、分支 main；实际 HEAD=fff0000、分支 feature-x。

## 为什么危险
AI 在虚构状态之上继续执行：提交到错误分支、覆盖他人改动、"验证"了从未存在的代码。聊天记录里的自信不构成证据。

## 常见三型
| 型 | 特征 | 处置 |
|---|---|---|
| HEAD_MISMATCH | 记录 HEAD ≠ 实际 HEAD | STOP → 以实际为准对账（更新记录或显式回退） |
| BRANCH_MISMATCH | 记录分支 ≠ 实际分支 | STOP → 显式确认目标分支 |
| UNKNOWN_DIRTY_WORKTREE | 工作区有未知脏改 | **保护性冻结**：不 reset、不 clean、不覆盖；列出脏文件交人工裁决 |

## 为什么先停
对账前任何"顺手修复"都可能销毁唯一证据或别人的工作。演示（三型+脏文件前后 hash 不变证明）：`examples/state-drift/`。

## Reconcile 流程
检测 → 分类 → 冻结 → （人工/编排者）确认哪边是真相 → 更新记录或显式 git 操作 → 重新核验 → 恢复执行。
