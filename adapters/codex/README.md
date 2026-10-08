# Codex Adapter

## Purpose
OpenAI Codex CLI 形态运行时；历史上作为实现者/接手方参与过完整工作流。

## Integration Contract
- **Project Truth**: 读 AGENTS.md + 六件套；无专属状态文件
- **Handoff**: 与其它 runtime 同一契约（读交接文件 + 独立 git 复核）
- **Provider**: 由用户在 Codex 私有配置中自配任意兼容服务商（本项目不内置、不推荐）

## Shared Truth Behavior
同上——六件套 + Git 唯一权威。

## 项目级安装与核验
将两个完整 Skill 目录复制至目标项目的 `.agents/skills/`：

```text
.agents/skills/ai-development-workflow/SKILL.md
.agents/skills/ai-software-legion/SKILL.md
```

在该项目打开 Codex，用 `/skills` 查看两个名称，再分别显式调用
`$ai-development-workflow` 和 `$ai-software-legion`，要求读取入口及能力索引，
报告缺失依赖。安装目录与调用方式参见 [Codex 官方说明](https://developers.openai.com/codex/skills/)。

发现入口、读取正文、执行能力和跨运行时接力是不同的验证层次。
本项目中的 `<runtime-home>` 不会自动解析；复制两个入口也不会安装它们引用的
外部能力、军团实体或私有注册表。应由宿主环境提供并逐项验证，不能自动复制私人配置。

## Known Limitations
- 端到端可用性取决于用户配置的 provider 当前是否可用（协议层与 provider 层分离，见 `protocols/provider-error-handling.md`）

## Verification Status
**DRAFT** — adapter/协议层已在真实项目历史验证（任务接力、git 现实复核、身份不变量）；**当前本地 provider 可用性属环境特定**，发布时点的完整端到端重验未执行。表述区分：protocol validated historically ≠ currently fully verified end-to-end.
