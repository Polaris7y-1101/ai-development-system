# 软件开发 Workflow（军团结一生命周期）

> 位置: `<runtime-home>/legion/workflow.md`
> 与 `protocols/task-lifecycle.md` 配套：本文件是**端到端工作流**，后者是**状态机定义**。

---

## 主流程

```
Founder Requirement
  ↓
Requirement Validation      (瑶光: 价值/场景/MVP/AC)
  ↓
Task                        (天枢: requirement-to-task → draft→approved)
  ↓
Repo Reality                (天璇/天枢: repo-reality-check)
  ↓
Architecture                (天璇: 方案 + API Contract + 数据模型 + 回滚)
  ↓
Plan                        (天枢: 拆 Frontend/Backend Task → planned)
  ↓
Worktree                    (天枢: git-worktree-manager → 隔离; Worktree belongs to Task)
  ↓
Coding                      (天玑/天权: 按 Runtime/Model/Provider 派单)
  ↓
Self Check                  (实现者: 语法/lint/build/local tests)
  ↓
Code Review                 (Independent Reviewer: 默认天璇; 前提 reviewer != implementer)
  ↓
QA                          (玉衡: 验收; FAIL→Bug→返工→回归)
  ↓
Founder Acceptance          (Founder)
  ↓
Ready To Release            (天枢 + Founder 双确认)
  ↓
Release                     (开阳: release-rollback)
  ↓
Smoke Test                  (开阳: Health + Smoke)
  ↓
Completed
```

## 异常状态

```
blocked / failed / rollback / cancelled
```

---

## 每步的载体

| 步骤 | 入口技能 | 产出 |
|------|---------|------|
| Requirement Validation | `requirement-to-task` | 价值判断 + AC |
| Task | `requirement-to-task` | Task 文件 |
| Repo Reality | `repo-reality-check` | 真实代码状态 |
| Architecture | `api-contract` / `database-migration` | 设计文档 |
| Plan | `requirement-to-task`（拆 Task） | 子 Task |
| Worktree | `git-worktree-manager` | 隔离树 + HEAD |
| Coding | `coding-agent-router` + `relay-provider-router` + `relay-health-check` | 代码 + commit |
| Self Check | `backend-development` / `frontend-development` | 检查结果 |
| Code Review | `requesting-code-review` | Review 结论 |
| QA | `test-driven-development`（验证面） | QA 报告 |
| Release | `release-rollback` | 部署报告 |
| 全程 | `handoff-state-sync` + `security-secrets-gate` | Handoff + 安全 |

---

## 规则

1. 每个状态迁移**必须有 Handoff 且 Ready=YES**。
2. **禁止把"代码写完"当 completed。**
3. 同一时间最多 1 个 `active` Task。
4. Review/QA 未过不得进入下一态。
5. 每次派单前必须构建 **Dispatch Package**。
6. Runtime/Model/Provider **不写死在 Persona**，由 Router 运行时决定。
7. **独立 Review 规则（BASIC-001 / MIG-001 权威定义，其余文件引用本条）：**
   - `Developer != Final Independent Reviewer`（铁律）
   - 北斗默认 Independent Review Owner：**architect（天璇）**，但前提 `reviewer != implementer`——天璇参与本 Task 实现时必须改派
   - Reviewer 资格：未实现本次被审代码 + 拥有/被授予 `code-review-gate` + 无 Role Contract 冲突 + 不违反 Separation of Duties + Review Scope 与 Reviewed HEAD 明确
   - 无任何合格独立 Reviewer → 输出 `REVIEW_INDEPENDENCE_MISSING`，Review Gate = BLOCKED，Task 不得由 `READY_FOR_REVIEW` 进入 `READY_FOR_QA`
   - 禁止：开发者自审冒充 Independent Review / 跳过 Review 推进状态 / 为此新增第 10 个默认北斗角色
8. **Worktree 归属（MIG-002，权威定义见 git-worktree-manager skill 的 Ownership 节）：** Worktree belongs to Task（不属于 AI/Runtime/Model/Provider）；AI/Runtime/Model/Provider Switch 均不构成新 Worktree 理由。
