# Task Lifecycle（任务生命周期）

## 状态机（canonical state machine）

```
PLANNED → READY_FOR_IMPLEMENTATION → IN_PROGRESS → REVIEW → QA → READY_FOR_HUMAN_ACCEPTANCE → CLOSED
                ↑                         |
                └── BLOCKED（门禁阻断：REVIEW_INDEPENDENCE_MISSING / QA_COVERAGE_MISSING / STATE_DRIFT 等，解除后回到前置状态）
```

规则：状态只能由工作流事件推进；评审未过不得进 QA；QA 未过不得申请人工验收；人工验收未过不得 CLOSED。证据随状态记录（claim scope ≤ evidence scope）。

---
# Task Lifecycle 协议 (P1)

> 位置: `<runtime-home>/legion/protocols/task-lifecycle.md`

---

## 正式生命周期

```
draft
 ↓  天枢建 Task + Founder/Boss 确认
approved
 ↓  瑶光裁剪 + 天璇出方案
planned
 ↓  构建 Dispatch Package + 选 Runtime/Provider + health-check
active
 ↓  Coding Agent 实现 + 自审 + commit + Handoff
code_review
 ↓  Reviewer（与开发者不同 Runtime）审查
qa
 ↓  玉衡验收（PASS/FAIL）
founder_acceptance
 ↓  Founder 验收
ready_to_release
 ↓  开阳部署
released
 ↓
completed
```

## 异常状态

```
blocked    ← 依赖未满足 / 需求不清 / 需扩范围
failed     ← 反复失败 / DoD 未达且无法修复
rollback   ← 发布后验证失败，已回滚
cancelled  ← Founder/天枢 主动终止
```

---

## 状态流转规则

| 当前 | 事件 | 下一个 |
|------|------|--------|
| draft | Founder 确认 | approved |
| approved | 方案就绪 | planned |
| planned | Dispatch Package + health-check 通过 | active |
| active | 开发 Handoff Ready=YES | code_review |
| active | 开发失败/阻断 | blocked / failed |
| code_review | Review PASS | qa |
| code_review | Review FAIL | active（返工）|
| code_review | 无合格独立 Reviewer（`REVIEW_INDEPENDENCE_MISSING`） | **blocked**（Review Gate = BLOCKED，禁止进 qa）|
| qa | PASS | founder_acceptance |
| qa | FAIL | active（Bug Report 返工）|
| founder_acceptance | 通过 | ready_to_release |
| ready_to_release | 部署成功 | released |
| released | 观察无异常 | completed |
| released | 验证失败 | rollback |
| 任意 | Founder/天枢终止 | cancelled |

## 硬性规则

1. **禁止把"代码写完"标记为 `completed`** —— 必须走完 code_review → qa → acceptance → release。
2. 同一时间**最多 1 个 `active` Task**（除文件不冲突的并行特批）。
3. `blocked` 必须写明阻塞原因与解除条件。
4. 每次状态变更记录：时间 / 操作者 / 依据（Handoff 或 Bug Report）。
5. **Independent Review Evidence（MIG-001）**：code_review → qa 的流转必须附 Review 证据，至少绑定 `Task ID / Reviewer Role / Implementer Role / Branch / Reviewed HEAD / Review Scope / Findings / Result`，且可证明 `reviewer != implementer`；缺任一项视为 Review 未完成。

## 落盘

```
<project>/tasks/
├── draft/  approved/  planned/  active/  review/  qa/
├── completed/  blocked/  failed/
└── TASK_QUEUE.md        # 运行时状态总表
```
