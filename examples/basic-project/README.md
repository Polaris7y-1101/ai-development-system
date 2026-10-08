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
任务文件实际经过 PLANNED → READY_FOR_IMPLEMENTATION → IN_PROGRESS → REVIEW → QA → READY_FOR_HUMAN_ACCEPTANCE → CLOSED，采用公开 demo 协议的状态名。
随后演示 **失败路径**：独立的 violation 任务停在 REVIEW；architect 自我评审时，同一 gate 返回非零并输出 `REVIEW_INDEPENDENCE_MISSING`，禁止进入 QA。

Review、QA 和人工批准均标注 `SIMULATED`，是离线 fixture，不是实际评审或用户批准的证据。
每次运行创建独立临时目录，不删除已有目录；输出 `DEMO_DIR` 给出结果位置，可检查 `CURRENT_TASK.md`、`transitions.log` 和 `violation/CURRENT_TASK.md`。运行后目录保留供检查，使用者自行清理。

## Expected result
`expected/normal_run.txt`（8 阶段全过 + commit 链）与 `expected/violation_run.txt`（BLOCKED: REVIEW_INDEPENDENCE_MISSING）。

## Rule tested
workflow 规则：review independence / QA separation / human approval / task lifecycle。
**Failure looks like**：violation 路径中 gate 输出 BLOCKED 且 task 停在 REVIEW 阶段，不得 CLOSE。
