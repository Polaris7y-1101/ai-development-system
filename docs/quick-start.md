# Quick Start（快速开始）

> 面向所有用户——不假定你会编程。全程约 15 分钟。

## 你需要什么
- 一个 Git 仓库（已有的项目即可；不会 Git 就请人帮你 `git init` 一个）
- 任意一个 AI 编程助手（Hermes / Claude Code / Codex / 其它）

## 7 步上手

**1. 安装两个 Skill** — 把 `skills/ai-development-workflow/` 与 `skills/ai-software-legion/` 两个目录复制进你 AI 助手的 skills 目录（各助手安装方式不同，通常是 `~/.<runtime>/skills/` 或项目内 `.skills/`）。

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
