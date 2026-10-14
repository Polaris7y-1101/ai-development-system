# Repository reality check

先读 [项目契约](project-contract.md)。此能力只读本地仓库，不连接生产服务。

1. 确认用户指定的仓库根、目标任务、允许范围。执行 `git rev-parse --show-toplevel`、`git branch --show-current`、`git rev-parse HEAD`、`git status --porcelain=v1 -z --untracked-files=all`、`git worktree list --porcelain`，记录命令是否成功。
2. 阅读项目 AGENTS.md、CURRENT_TASK.md、PROJECT_STATE.md、当前 handoff 和与任务有关的源码/文档。报告事实来源；缺文件说明其影响。
3. 对至少一个与任务有关的现行文档主张，核对真实文件或命令行为。区分现行承诺、历史引用、占位符和示例，不能把整篇文档里的每个路径一概视为必须存在。没有可核验主张时写 NOT_CHECKED 及原因，不写 CONSISTENT。
4. 检查当前任务的六处状态是否遵守项目契约。未知修改、分支/HEAD/任务身份冲突都列出，不尝试清理。
5. 输出：Repo、Branch、HEAD、工作区状态、worktree 情况、逐项“主张/实际/证据”、CONSISTENT/DRIFT/UNKNOWN、Blockers、建议下一步。

确定性路径检查若写成脚本，需在独立测试材料中证明“确实存在”通过、“明确不存在”拒绝；不能用空提取结果证明无漂移。读 Git 得到错误时不能推断仓库干净。

本能力可给出允许进入下一步的建议，但不替代独立 Review、QA 或人的验收。
