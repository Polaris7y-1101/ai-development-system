# Claude Code Adapter

## Purpose
Claude Code 是 CLI 形态 AI 编程运行时；常用作实现者/评审者，亦可作接手方（resume）。

## Integration Contract
- **Project Truth**: 读 AGENTS.md/CLAUDE.md 项目说明 + 六件套；无专属状态文件
- **Handoff**: 接手时读 CURRENT_HANDOFF + CURRENT_TASK → 独立 git 复核 → 继续任务（不依赖前任聊天记录）
- **Environment**: 模型经环境变量指向用户自配的任意兼容服务商（本项目不内置）

## Shared Truth Behavior
同上——六件套 + Git 唯一权威。

## Known Limitations
- 长命令输出经消息网关中转时可能被截断（环境相关）
- 首次冷启动有秒级延迟（环境相关）

## Verification Status
**VERIFIED** — 跨 AI 往返（A→checkpoint→CC→resume→继续）与 provider 变更零影响均已验证。
