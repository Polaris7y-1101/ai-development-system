# Hermes Adapter

## Purpose
Hermes 是一个带 gateway/skill/delegation 能力的 AI 助手运行时；本适配器契约定义它如何参与本系统工作流（常用作 orchestrator/dispatcher 或实现者）。

## Integration Contract
- **Skills**: 复制两个顶层 skill 到 Hermes skills 目录；`hermes skills list` 应可见两者
- **Project Truth**: Hermes 读写六件套文件，不建 runtime 专属状态文件
- **Delegation**: 通过其 delegation 机制派任务时，凭据走其私有 provider 配置（用户自管），任务上下文走 Task Packet
- **Git Reality**: 执行前后必须 `git rev-parse/branch/status` 复核并写入记录

## Shared Truth Behavior
六件套 + Git 为唯一权威；Hermes 会话记忆（L0）可丢弃。

## Known Limitations
- 配置快照在长驻进程内可能滞后于配置文件（重启进程生效）
- delegation 子代理同样受独立评审约束

## Verification Status
**VERIFIED** — 端到端验证：任务生命周期、跨 AI 交接、delegation（含 gateway 进程内）、漂移检测阻断。
