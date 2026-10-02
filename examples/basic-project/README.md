# Demo D1 — basic-project（Full Task Lifecycle）

## What this demonstrates
一个任务从 Bootstrap 到 CLOSED 的完整生命周期，以及两条铁律：
1. **Developer != Final Independent Reviewer**（实现者不得担任最终独立评审）
2. QA / Human Acceptance 分层把关

## Starting state
`scenario/project/` 是一个最小项目：AGENTS.md + PROJECT_CONTEXT.md + 六件 Project Truth 文件 + fixture 源码（无任何 runtime-specific 状态文件）。

## Steps（可执行）
```bash
cd examples/basic-project && ./run_demo.sh
```
脚本按协议确定性流转：
Bootstrap → CURRENT_TASK(PLANNED→READY_FOR_IMPLEMENTATION) → Implementation(backend) → **Independent Review(architect)** → QA(yuheng-qa) → Human Acceptance Preparation → CLOSED。
随后演示 **失败路径**：architect 参与实现后自我评审 → 检测器输出 `REVIEW_INDEPENDENCE_MISSING` 并阻断（无替代 reviewer 时不放行）。

## Expected result
`expected/normal_run.txt`（8 阶段全过 + commit 链）与 `expected/violation_run.txt`（BLOCKED: REVIEW_INDEPENDENCE_MISSING）。

## Rule tested
workflow 规则：review independence / QA separation / human approval / task lifecycle。
**Failure looks like**：violation 路径中 gate 输出 BLOCKED 且 task 停在 REVIEW 阶段，不得 CLOSE。
