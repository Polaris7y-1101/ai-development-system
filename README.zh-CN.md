# AI Development System（AI 开发系统）

> **Git-first、支持跨 AI 接力的项目连续性与 AI 软件开发编排系统。**
> 核心信念：工程的唯一事实源是 Git 仓库——不是任何 AI 的聊天记录。

**状态：v0.1.0（早期公开开发版）**。源自真实多 runtime 软件开发工作流的抽象与验证。

## 这是什么？

一套 Skill + 协议 + 注册表 + 预设军团，让多个 AI 编程助手（不同运行时/模型/服务商）协作同一个项目时**不丢上下文**——切换 AI 后，下一个（AI 或人）能从 Git 里的共享项目记忆精确接续。

## 解决什么问题？
- 每个 AI runtime 各有会话记忆，一切换就断片
- 聊天记录不是可审计的工程状态——"AI 说测试过了"不是证据
- 记录状态与仓库现实悄悄漂移（错分支/旧 HEAD/脏工作区）→ 在虚构之上盲跑
- 多 Agent 团队需要角色分工、独立评审与 QA

## 核心架构（自上而下，层层可替换）
人（审批边界）→ AI 军团（角色/责任覆盖，可配置预设）→ 工作流（生命周期/门禁/证据规则）→ Runtime 适配器（Hermes/Claude Code/Codex/...）→ 逻辑模型档位 → Provider（自配任意兼容服务商）。
**换 Provider 不动角色；换 Runtime 不重写工作流；角色永不硬编码模型品牌。**

## 两个顶层 Skill（全部能力的入口）
- `ai-development-workflow` —— 怎么做：14 步标准流、能力索引、门禁分级、跨 AI 切换
- `ai-software-legion` —— 谁来做：军团导航、角色契约模板、Provider 注册表模板、北斗九星预设

## 六件工程事实文件（Git-first Project Truth）
`CURRENT_TASK.md` · `CURRENT_HANDOFF.md` · `PROJECT_STATE.md` · `memory/PROJECT_MEMORY.md` · `memory/LESSONS.md` · `docs/decisions/ADR-*.md`——详见 `docs/project-memory.md`。禁止 runtime 专属副本。

## STATE_DRIFT（状态漂移）
记录 ≠ 现实时：检测 → 分类 → **停止盲执行** → 对账。三型：HEAD 不符/分支不符/未知脏工作区（保护性冻结：不 reset、不 clean、不覆盖）。见 `docs/state-drift.md` 与 `examples/state-drift/`。

## 跨 AI 交接
Handoff 是**待核验的主张，不是免检的凭证**：Runtime B 只凭 CURRENT_HANDOFF + CURRENT_TASK + 独立 git 现实复核接续，从不读 A 的聊天记录。演示：`examples/cross-ai-handoff/`。

## 独立评审 / QA / 人工审批
- **开发者 ≠ 最终独立评审人**（违者 `REVIEW_INDEPENDENCE_MISSING` 阻断）
- QA 独立于评审验证
- 生产部署/保护分支合并/凭据轮换/force push 等属 `HUMAN_APPROVAL_REQUIRED` 或 `AUTO_FORBIDDEN`

## Runtime 适配器状态（以证据为准）
Hermes：**VERIFIED**｜Claude Code：**VERIFIED**｜Codex：**DRAFT**（协议层历史验证；当前本地 provider 可用性取决于你配置的环境）

## Provider 政策
**本项目不提供、不推荐、不背书、不内置任何具体服务商/中转站。** 你通过 Generic Provider Registry 自行配置任意兼容 Provider（`docs/provider-policy.md`）。

## 快速开始 / 示例 / 文档
`docs/quick-start.md`（不假定你会编程）；四个离线确定性演示在 `examples/`；架构/记忆/漂移/军团/安全文档在 `docs/`。

## 许可
Apache License 2.0（见 `LICENSE` 与 `NOTICE`）。
