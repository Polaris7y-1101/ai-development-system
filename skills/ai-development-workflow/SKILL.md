---
name: ai-development-workflow
description: AI Development Workflow v0.1 顶层标准入口（HOW）——标准开发流 14 步、Gate/路由/记忆/发布能力索引、Cross-AI 连续性（checkpoint/handoff/resume）、独立 Review 与 QA 规则引用。当用户提到 开发工作流/task lifecycle/repo reality/worktree/gate/QA/handoff/resume/发布回滚 时使用。Legion（WHO）见 ai-software-legion skill。
version: 1.0.0
license: Apache-2.0
---

# AI Development Workflow v0.1 — 顶层标准入口（HOW）

> **Workflow = HOW；Legion = WHO（`ai-software-legion`）。**
> 本 Skill 是壳：能力实体全部原地不动（`REFERENCE`，非 `MOVE/COPY`），可验证索引见同目录 `capabilities.yaml`。
> v0.1 公开顶层 Skill 恰 2 个：`ai-development-workflow` + `ai-software-legion`。

## 1. 标准开发流（14 步）

```
Requirement → Task Definition → Repo Reality Check → Task Isolation
→ Role / Capability Resolution（WHO 由 Legion 提供，本层只消费）
→ Runtime / Model / Provider Resolution
→ Implementation → Automated Verification → Independent Review
→ QA → Security / Scope Gate → Human Acceptance
→ Integration / Release → Close
```

## 2. 分层路由（Task/Role → Runtime → Model → Provider）

| 层 | Capability | 实现源（见 capabilities.yaml） |
|---|---|---|
| Coding Runtime | `coding-agent-router` | VERIFIED（user skills） |
| Logical Model | `model-router` | **PARTIAL**（legion/model-registry.yaml + 宿主 Router，无独立 skill） |
| Provider/Relay | `relay-provider-router` / `relay-health-check` | VERIFIED |

## 3. Gate 层（四级分离，不得混同）

```
Developer Self Check  !=  Independent Review
Review PASS           !=  QA PASS
QA PASS               !=  Human Acceptance
Human Acceptance      !=  Protected Human Approval
```

- `code-review-gate`（canonical）→ 实现：`requesting-code-review`（**EXTERNAL_BUILTIN**，Hermes 内置 `<runtime-home>/hermes-agent/skills/software-development/requesting-code-review`；备用实现源 `github-code-review`）。**alias 映射，不复制实现，不形成第二真相**
- **BASIC-001 引用（不重新发明）**：`Developer != Final Independent Reviewer`；默认 Independent Review Owner = architect/天璇，前提 `reviewer != implementer`；无合格 Reviewer → `REVIEW_INDEPENDENCE_MISSING` **禁止进入 QA**。权威定义：`<runtime-home>/legion/workflow.md` 规则 7
- `qa-gate`：`QA != Developer`；QA Failed → Original Developer → Fix → Review → QA Regression（实现载体：legion roles/05-yuheng-qa.md + workflow.md）
- `security-secrets-gate`：VERIFIED（独立 skill 实存）
- `scope-gate`：白名单机制，载体 task-lifecycle.md
- `human-acceptance-preparation`：AI 只**准备**验收材料；**AI 不拥有 human-acceptance，更不拥有 human-approval**。受保护动作清单引用 `legion/safety-boundary.md`（SAFETY_BOUNDARY），不复制第二套；Workflow 只判 `Approval Status: REQUIRED / PENDING / APPROVED / REJECTED`

## 4. Git / Worktree（引用权威，不复制协议）

`Worktree belongs to Task`（权威：`git-worktree-manager` skill Ownership 节）。
四不变式：`AI / Runtime / Model / Provider Switch ≠ New Worktree`（含 Provider 429 failover）。
脏状态不明 → `UNKNOWN_WORKTREE_CHANGES` 冻结。`prunable != safe to delete`。

## 5. Memory / Continuity（Cross-AI 连续性，本层内部能力）

三核心（均 VERIFIED 实存）：`session-checkpoint` / `handoff-state-sync` / `session-resume`。

**Cross-AI 切换流**（已验证 Hermes → Codex → Hermes 基础）：

```
Checkpoint → Handoff → Switch → Resume → Reality Check → Drift Detection → Continue
```

- Runtime 切换不产生新 Task / 新 Worktree / 新 Project Truth
- Project Memory belongs to Project / Repository
- STATE_DRIFT 严重度（权威在 repo-reality-check）：`NONE / INFORMATIONAL / TASK_RELEVANT / CRITICAL / UNRESOLVED`
- `project-memory-bootstrap` / `project-memory-audit`：**DRAFT**（文档级逻辑，未 VERIFIED）

## 6. Task Lifecycle（引用 STATUS_MODEL，不新增模糊状态）

权威：`<runtime-home>/legion/protocols/task-lifecycle.md`
Normal: PLANNED → READY_FOR_IMPLEMENTATION → IN_PROGRESS → READY_FOR_REVIEW → READY_FOR_QA → READY_FOR_HUMAN_ACCEPTANCE → ACCEPTED → CLOSED
Exceptional: BLOCKED / REVIEW_CHANGES_REQUESTED / QA_FAILED / ACCEPTANCE_FAILED

**五类状态分离**：`Task State != Module Result != Drift Severity != Evidence Status != Approval Status`

## 7. Evidence（引用 EVIDENCE_STANDARD）

`Claim Scope <= Evidence Scope`；Evidence HEAD-aware。证据规范不在各 Gate 重复复制，统一引用 EVIDENCE_STANDARD（载体：repo-reality-check / agent-team-governance 的证据节）。

## 8. Provider Policy（公开匿名铁律）

本层公开内容：不提供/不推荐 Provider、不绑定真实 Relay、零真实 Provider 名、零私人 Base URL、零 API Key。示例只用 `provider-a / provider-b / official-provider / relay-provider`。私有配置原地不动（`<runtime-home>/legion/*-registry.yaml`，env 名制）。

## 9. Capability Index

全部能力的 `capability_id / category / implementation_path / status / alias / notes` 见 **`capabilities.yaml`**（同目录）。状态枚举：`VERIFIED_EXISTING / PARTIAL / DRAFT / MISSING / EXTERNAL_BUILTIN / DEPRECATED`。

## 10. 红线

- ❌ 不移动/不删除/不改写任何既有 skill（KEEP + INDEX + REFERENCE）
- ❌ 不复制实现形成第二真相（alias/引用承载一切标准化）
- ❌ 不把内部能力提升为第三个 Top-Level Skill
- ❌ 旧执行入口必须继续可用（Compatibility：旧 skill 名 → 原路径不变）
