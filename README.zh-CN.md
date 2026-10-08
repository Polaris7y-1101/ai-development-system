# AI Development System（AI 开发系统）

> **Git-first、支持跨 AI 接力的项目连续性与 AI 软件开发编排系统。**
> 核心信念：工程的唯一事实源是 Git 仓库——不是任何 AI 的聊天记录。

**状态：开发者预览版。** 面向能配置运行时依赖、检查 Git 状态的技术用户。两个 Skill 是引用入口，复制目录不会安装全部能力实现，也不代表获得已完整验证、开箱即用的系统。

试用前请阅读[安装指南](docs/quick-start.md)与[验证状态和限制](docs/verification-status.md)。历史项目验证不等于当前修订的干净安装或跨运行时验收。待发布改动见 [CHANGELOG](CHANGELOG.md)，已发布版本见 [Releases](https://github.com/Polaris7y-1101/ai-development-system/releases)。

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
Hermes 与 Claude Code 的适配器文档保留历史项目验证记录，本次修订尚未重跑其完整实机验收。Codex 保持 **DRAFT**：项目级入口发现已通过，实际文件读取被本机沙箱工具错误阻断，能力执行未验证。分层结果见[验证状态](docs/verification-status.md)，不能把历史 VERIFIED 标签解释为本版本普遍可用。

## Provider 政策
**本项目不提供、不推荐、不背书、不内置任何具体服务商/中转站。** 你通过 Generic Provider Registry 自行配置任意兼容 Provider（`docs/provider-policy.md`）。

## 快速开始 / 示例 / 文档
[快速开始](docs/quick-start.md)说明安装位置、外部依赖与验收步骤；建议具备 Git 和运行时配置基础。四个离线确定性演示在 `examples/`；它们不等于实际 Review、QA、人工批准或跨运行时接力。

当前本机测试 13/13、四个离线 Demo、10 个 YAML 解析通过；每个新提交的 GitHub Actions 结果需单独查看。Hermes ↔ Codex 双向实机接力仍待完成。

## 许可
Apache License 2.0（见 `LICENSE` 与 `NOTICE`）。
