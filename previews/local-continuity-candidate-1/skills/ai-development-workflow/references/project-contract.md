# Local project contract / 本地项目契约

## 范围与初始化

本契约适用于经用户授权的独立本地 Git 测试仓库，不要求任何私人 runtime-home 或外部服务。

先定位仓库根并读项目 AGENTS.md 与既有规则。已有任务结构与本契约冲突时，不自动改造；报告不兼容项。空项目可以在用户批准的测试目录 `git init -b main`，按下列结构建立初始文件，并显式逐文件提交基线。真实用户身份不明时不要写全局 Git 配置；合成测试仓库可设本仓库合成身份，真实项目缺身份则报告。

```text
AGENTS.md                       本项目允许的范围、State Contract: ADS-CONTINUITY-1
CURRENT_TASK.md                 Task ID / State / Goal / Allowed Files / Acceptance Criteria
PROJECT_STATE.md                Task ID / State / Summary
handoffs/CURRENT_HANDOFF.md     按 handoff-state-sync 中的契约填写
memory/PROJECT_MEMORY.md        已确认的项目事实
memory/LESSONS.md               有证据的教训
docs/decisions/ADR-000.md       本地试用范围和约定
tasks/active/<task-id>.md       Task ID / State / Acceptance Criteria
tasks/TASK_QUEUE.md             每个任务一行：Task ID | State
board.md                       本地看板，同样每任务一行：Task ID | State
```

`<task-id>` 替换为实际稳定任务 ID。看板仅为仓库内 board.md；不要探测、修改或同步外部 Obsidian。AGENTS.md 的白名单必须包含确实需要写的任务记录、历史归档和业务文件。白名单内目录只允许事先明确用途的新增文件，不意味可任意扩大范围。

初始化 handoff 使用 `Commit SHA: UNESTABLISHED`、`Test Result: NOT_RUN`、Ready=NO，并说明尚无 checkpoint；这是初始化材料，不可据此恢复为 Safe=YES。初始状态记录可本地提交。首次 checkpoint 建立真实基线后替换它。

## 状态与证据

本地状态：active → code_review → qa → founder_acceptance → closed。blocked、failed 可记录异常；解除后回到原待处理阶段，不直接跳到 closed。只有已有对应证据才进入后续阶段：独立 Review 通过才进 qa，QA 通过才进 founder_acceptance，用户明确接受后才能 closed。实现完成可进 code_review，Ready=YES 表示可交给指定下一角色，不代表整个项目验收通过。

六处状态必须一致：任务卡目录、卡正文、CURRENT_TASK、PROJECT_STATE、TASK_QUEUE、board。卡正文用精确 `State: code_review` 等值，不附尾注。若任意不同，先报告，不把目录存在当语义一致。

测试只认实际命令、退出码与输出。没有运行时写 NOT_RUN，不能写 PASS。Ready=YES 同时要求任务当前阶段的验收标准满足、所需测试通过、无阻断问题。PASS+NO 是合法未就绪记录；FAIL+YES、NOT_RUN+YES 和无效枚举值必须拒绝。

用户的私有模型或 Provider 不必公开；无法可靠取得其名称时用 UNKNOWN，不编造。凭据和私人路径不要进入可分享的 handoff。

## Git 边界

不自动 push、合并、发布、reset、clean、prune、amend 或搬走未知文件。对范围外/来源不明变更，保留原样并报告。已知白名单内低风险修改可按任务授权做本地 checkpoint；若授权仅只读则不写。

用 `git status --porcelain=v1 -z --untracked-files=all` 识别完整状态，或逐项检查标准 Git 输出。不要截断输出后宣称 clean。有 Git 错误、超时、乱码无法可靠解析时，报告 UNKNOWN/BLOCKED，不当成空结果。

查看已跟踪事实文件用 `git ls-files --error-unmatch -- <path>`；对未跟踪候选文件可 `git add -n -- <path>` 检查忽略规则。不要自动改 .gitignore 或取消跟踪。未知 worktree 标为待核实，prunable 不等于可以删除。
