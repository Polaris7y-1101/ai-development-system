# Demo D4 — custom-legion（Preset ≠ 硬编码）

## What this demonstrates
北斗九星只是 **Default Preset**。改配置即可 Rename / Disable / Add，Workflow Core 不动。

## Steps
```bash
cd examples/custom-legion && ./run_demo.sh
```
基于 `scenario/legion.base.yaml`（9 角色抽象）：①rename：backend display_name 天玑→Orion（role_id 不变，引用不断）②disable：QA 置 disabled → 责任覆盖检查输出 `QA_COVERAGE_MISSING`（不自动认为 QA 不重要）③add：新增 security 角色 → 覆盖矩阵重算 security=covered，核心 workflow 零 diff。

## Expected result
`expected/output.txt`：`RENAME_OK id=backend stable` + `QA_COVERAGE_MISSING (do not auto-silence)` + `ADD_OK security=covered workflow_core_unchanged=true`。

## Rules tested
Display Name != Stable Role ID；责任覆盖显式重算；Legion 配置与 Workflow Core 解耦。
