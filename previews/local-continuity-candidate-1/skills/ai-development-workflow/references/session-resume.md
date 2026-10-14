# Session resume

此能力只读。先读 [项目契约](project-contract.md)、[handoff 契约](handoff-state-sync.md) 和 [checkpoint 语义](session-checkpoint.md)。从磁盘重新读取，不使用前任聊天总结代替。

1. 读取 AGENTS.md、CURRENT_TASK、PROJECT_STATE、handoff、项目记忆、相关 ADR 与任务规则，记录实际路径及缺项。核对任务 ID 一致。
2. 执行 [仓库核验](repo-reality-check.md)，检查六处状态和至少一项当前文档/代码事实。Git 命令失败或材料不足时 UNKNOWN，Safe=NO。
3. 检查最终 handoff 的 15 个字段、有效枚举和语义：FAIL/NOT_RUN+YES 拒绝；PASS+NO 记录合法未就绪并停止。Ready 不是 YES 时 Safe=NO。
4. 要求工作区完整 clean、分支与记录一致。验证 base/departure 恰为 40 位 hex，`git cat-file -e <base>^{commit}` 成功；不接受截取长串前 40 位或在另一仓库找得到就算通过。
5. 按 Checkpoint-Id 在提交消息中查找**完全一致的独立行** `ADS-Checkpoint: <id>`；必须唯一匹配，不能接受模糊 grep 的第一个结果。解析出的 checkpoint 必须等于当前 HEAD，且恰有一个 parent 等于 base。分支/HEAD 前进了就报告待对账，不将“base 是祖先”当充分证明。外部回复中的 SHA 只是辅证，不自动信任。
6. 读取该提交的 `diff-tree --name-status --no-renames`，核对 Changed Files 的路径集合、类型、无重复：多列、漏列、类型不同都拒绝。检查本次改动属于任务白名单，相关事实文件确实已被 Git 跟踪；只在本地磁盘存在不足以跨会话/机器传递。
7. 输出 SESSION_RESUME_REPORT：读取证据、Branch/HEAD、checkpoint/base、状态对照、改动清单对照、已完成与未完成事项、风险、下一角色、Safe To Continue=YES/NO 及原因。

只有上述实际检查通过，才可 Safe=YES。Safe=YES 仅表示可进入已授权的下一阶段；不得据此发布、写外部看板或替用户批准。发现漂移时不自动 reset、补写、提交、搬走文件或删除材料。
