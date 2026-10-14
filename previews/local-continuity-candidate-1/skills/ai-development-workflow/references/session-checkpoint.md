# Session checkpoint

读取 [项目契约](project-contract.md)、[handoff](handoff-state-sync.md) 与 [仓库核验](repo-reality-check.md)。用户授权本地写入/提交时才执行切出；只读任务只报告。

1. 实测 Git 分支/HEAD/status，读取当前任务和白名单。记录原暂存区；含范围外或不明改动则停止，不 commit、不移动、不删除它们。
2. 运行任务所需测试，保存命令和退出码。失败必须 FAIL/NO；未跑 NOT_RUN/NO。测试通过仍检查该阶段全部验收条件。
3. 如有旧 handoff，原文字节复制到唯一 `handoffs/archive/<checkpoint-id>.md`；已存在则换新 ID，不覆盖，不删历史。更新当前任务、状态与新 handoff。该归档动作是候选包明确采用的“复制保全”，不同于先移动后写回的暂存瞬间 rename；最终类型以 Git 为准。
4. 生成唯一 ID（例如 UUID），写 `Checkpoint-Id: <id>` 和 `Checkpoint-Ref: message-id <id>`。写 `Commit SHA: base/departure <完整40位提交前HEAD>`、`Branch: <当前分支>`。不要将即将生成的 commit SHA 写进自己的文件。
5. 按白名单显式逐文件 `git add -- <path>`，删除旧路径也必须显式加入；检查完整暂存区。用 `git -c core.quotepath=false diff --cached --name-status --no-renames` 取得本次路径和类型，填入 Changed Files。此为 handoff 的封存候选阶段：可据已满足的阶段条件写候选 Ready=YES，尚不得对外报告 SWITCH READY=YES。handoff 自身也应在清单内，再显式 stage 它。
6. 再次读取实际 handoff、状态与暂存清单。清单不匹配时先修正后复核；不能为了清单匹配 stage 白名单外文件。只有满足允许提交条件时创建本地提交，消息中单独一行 `ADS-Checkpoint: <id>`。
7. 提交后读取真实 SHA，并用 `git -c core.quotepath=false diff-tree --no-commit-id --name-status --no-renames -r <sha>` 逐项双向核对路径与类型。确认工作区 clean、base 为该 checkpoint 的唯一父提交。任何不一致就报告 SWITCH READY=NO，保留失败现场，用后续独立修复提交处理，不自动 amend。
8. 输出 checkpoint SHA、base、branch、测试证据、实际改动清单、归档路径和 SWITCH READY。对未提交或失败情况明确写 none/原因，禁止宣称完成。

`Ready=YES` 是 handoff 中针对下一个角色的声明；只有提交后核验也通过才输出 SWITCH READY=YES。人的最终验收仍独立。

退出码不是预设模板文字。不得在没有真实工具运行结果时填 PASS。不能把大文件状态截断、未知 Git 错误、失败测试或未知暂存变更当作通过。
