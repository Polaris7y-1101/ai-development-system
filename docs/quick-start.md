# Quick Start（快速开始）

> 开发者预览：建议具备 Git 与运行时配置基础。先完成依赖检查，再进行实际任务；安装入口不等于全部能力可运行。当前范围见[验证状态](verification-status.md)。

## 你需要什么
- 一个 Git 仓库（已有的项目即可；不会 Git 就请人帮你 `git init` 一个）
- 任意一个 AI 编程助手（Hermes / Claude Code / Codex / 其它）
- 对应宿主中可用的能力实现与配置；本仓库不打包全部外部依赖，也不提供私人凭据

## 7 步上手

**1. 安装两个 Skill** — 把 `skills/ai-development-workflow/` 与 `skills/ai-software-legion/` 两个目录完整复制进助手支持的 skills 目录。Codex 的项目级目录是 `.agents/skills/`，结果应为 `.agents/skills/ai-development-workflow/SKILL.md` 和 `.agents/skills/ai-software-legion/SKILL.md`。在该项目启动 Codex，使用 `/skills` 查看，或显式调用 `$ai-development-workflow`、`$ai-software-legion`。详见 [Codex adapter](../adapters/codex/README.md)；其他助手按各自安装文档操作。

**依赖检查**：这两个 Skill 是导航入口，不包含全部能力实现。`capabilities.yaml` 中的 `<runtime-home>` 是需要用户配置的路径占位符；先核对本机的实现路径、状态和依赖。能识别两个入口不等于工作流端到端可运行，缺失能力必须明确报告，不能把索引中的历史状态当成本机验证结果。

**安装成功分三层确认**：先确认运行时列出两个入口；再让它读取两个 `SKILL.md` 和 `capabilities.yaml`，报告实际路径及缺项；最后选择一个依赖齐备的小任务，实际执行并保留证据。任一层失败就报告该层的错误，不用后续模拟输出代替通过。跨运行时接力需另行验收。

**2. 初始化项目记忆（Bootstrap）** — 在仓库根建六件套：
```
CURRENT_TASK.md   PROJECT_STATE.md   handoffs/CURRENT_HANDOFF.md
memory/PROJECT_MEMORY.md   memory/LESSONS.md   docs/decisions/ADR-000-template.md
```
（可直接抄 `examples/basic-project/scenario/project/` 的模板。）

**3. 选一个军团（Legion）** — 默认用北斗九星预设（9 角色含独立评审+QA），或按 `docs/legion.md` 自定义。

**4. 建第一个任务** — 在 `CURRENT_TASK.md` 写清：Task ID / 目标 / 范围（Scope）/ 范围外（Out of Scope）/ 验收标准。

**5. 核验 Git 现实** — 让 AI 执行并记录：当前分支、HEAD、工作区是否干净。一切记录以 `git` 实况为准。

**6. 启动工作流** — 按 `protocols/task-lifecycle.md` 流转：实现 → **独立评审**（实现者不能自己评审自己）→ QA → 人工验收 → 关闭。演示见 `examples/basic-project/`。

**7. 切换 AI 时做交接** — 切走前写 `handoffs/CURRENT_HANDOFF.md`（任务/分支/HEAD/下一步）；新 AI 上来先读交接文件 + 独立复核 git 实况再动工。演示见 `examples/cross-ai-handoff/`。

## 三条铁律（记住就赢）
1. 工程事实只信 Git 仓库里的六件文件
2. 记录与实际不一致 → 先停后对账（STATE_DRIFT）
3. 谁实现，谁就不能当最终评审
