# Codex Adapter

## Purpose
OpenAI Codex CLI 形态运行时；历史上作为实现者/接手方参与过完整工作流。

## Integration Contract
- **Project Truth**: 读 AGENTS.md + 六件套；无专属状态文件
- **Handoff**: 与其它 runtime 同一契约（读交接文件 + 独立 git 复核）
- **Provider**: 由用户在 Codex 私有配置中自配任意兼容服务商（本项目不内置、不推荐）

## Shared Truth Behavior
同上——六件套 + Git 唯一权威。

## Known Limitations
- 端到端可用性取决于用户配置的 provider 当前是否可用（协议层与 provider 层分离，见 `protocols/provider-error-handling.md`）

## Verification Status
**DRAFT** — adapter/协议层已在真实项目历史验证（任务接力、git 现实复核、身份不变量）；**当前本地 provider 可用性属环境特定**，发布时点的完整端到端重验未执行。表述区分：protocol validated historically ≠ currently fully verified end-to-end.
