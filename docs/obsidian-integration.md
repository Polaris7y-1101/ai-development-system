# Obsidian Integration

> **Obsidian = Human Knowledge Layer. Git Repo = Engineering Source of Truth.**

## 定位
Obsidian 存人的知识：跨项目看板、想法（Idea Inbox）、复盘、个人笔记。工程事实（任务/状态/交接/ADR/分支）只活在 Git 仓库。

## 机制（详见 `integrations/obsidian/`）
- **Pointer Dashboard**：看板只放链接与人类摘要；显示工程状态必须标 `DERIVED — DO NOT EDIT HERE` + 来源
- **Promotion（单向提升）**：Idea→Task（走 requirement-to-task，人决定）；笔记→项目规则；复盘→LESSON（四步验证链）；brainstorm→ADR
- **禁止**双向可编辑工程同步；私人 Vault 内容永不入公开包
