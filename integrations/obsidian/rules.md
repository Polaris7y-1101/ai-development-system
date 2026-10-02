# Obsidian Source of Truth Rules（Generic）

1. **Source of Truth 边界**：CURRENT_TASK / PROJECT_STATE / CURRENT_HANDOFF / PROJECT_MEMORY / LESSONS / ADR / Branch / HEAD / Worktree / Git Status / Test·Review·QA·Release Evidence 一律以 Git Repo 为唯一权威；Obsidian 不维护第二份可编辑 Truth。
2. **Pointer Dashboard**：Obsidian 看板 = Navigation / Human Dashboard——项目名、人类摘要、Repo 与权威文件链接、人类优先级、个人笔记；不手工维护任务状态/分支/HEAD。
3. **Derived Snapshot**：为方便显示工程摘要时，必须带 Source + Generated At + `DERIVED — DO NOT EDIT HERE` 标记。
4. **Idea → Task Promotion**：Idea 默认状态 IDEA；经 Human Owner 选择 + requirement-to-task 产生 Repo Task；原 Idea 留 Task ID 引用，不双向编辑。
5. **Human Note → Project Rule Promotion**：影响 AI 工程执行的稳定个人规则，经 Owner 决定进入 Repo 规则文件。
6. **Retrospective → Lesson Promotion**：个人观察须完成 Observed → Confirmed Cause → Verified Resolution → Prevention Rule 才进 Repo Lessons（v0.1 无 LESSONS.md 时落 PROJECT_RULES.md / docs/decisions/）。
7. **Architecture Note → ADR Promotion**：brainstorm/比选留在 Obsidian；正式决定进 Repo `docs/decisions/ADR-*.md`，Obsidian 留 pointer。
8. **禁双向可编辑工程同步**：只允许 Repo → Obsidian derived view，或 Obsidian → Human intent → explicit promotion。
9. **Private data boundary**：私人项目名/本机路径/密钥留在 Private Vault；密钥类永不入任何 Dashboard。
10. **Public package boundary**：公开模板零私有路径/项目名/Provider/Secret，一律占位符。
