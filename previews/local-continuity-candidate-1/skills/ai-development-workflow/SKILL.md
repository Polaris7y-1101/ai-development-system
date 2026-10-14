---
name: ai-development-workflow
description: Use when a local Git project needs a repository reality check, task handoff, session checkpoint, or resume. 使用于本地项目核验、交接、切出和恢复。
license: Apache-2.0
---

# AI Development Workflow — continuity candidate

本候选包只提供四项本地接力能力。能力实现是由 AI 读取并执行的操作规范，不是自动守护进程或强制安全沙箱。它需要能读写项目文件、执行 Git 与项目测试的 AI 助手。

以本文件所在目录为路径起点，按任务读取实际能力文件：

| 任务 | 必须读取的实现 |
|---|---|
| 查仓库现实、核对文档 | [repo-reality-check](references/repo-reality-check.md) |
| 写交接并同步状态 | [handoff-state-sync](references/handoff-state-sync.md) |
| 切出前保存工作 | [session-checkpoint](references/session-checkpoint.md) |
| 新会话接手 | [session-resume](references/session-resume.md) |

首次使用先读 [本地项目契约](references/project-contract.md)，按其中的最小初始化步骤建立项目事实。能力索引是 [capabilities.yaml](capabilities.yaml)，JSON 编码也是合法 YAML。

工程状态以当前文件和 Git 实况为准；聊天历史和交接文字是待核验的主张。执行者自查、独立 Review、QA、人工验收分别记录。项目已有规则优先，不擅自转换现有 lifecycle；契约不兼容时列明差异并停止状态写入。

本包没有模型/Provider 路由、自动多代理调度、生产审计、外部看板、发布或回滚实现。遇到这些要求，报告超出本包范围。已具备的用户授权适用于其范围内的操作；未知脏文件和范围外操作不因“安装了 Skill”获得授权。

Use the linked local procedures, inspect actual files, and report what ran. Package discovery is not task completion. Never infer human acceptance from tests or a previous conversation.
