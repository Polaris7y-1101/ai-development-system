# Handoff and state sync

先读 [项目契约](project-contract.md)；执行一次 [仓库核验](repo-reality-check.md)。仅在任务授权内更新本地记录。

当前 handoff 必须有以下 15 个非空字段。格式每字段独占一行，多行清单缩进。没有事项可写 NONE 并保证属实。

```text
Task ID:
Agent:
Runtime:
Model:
Provider:
Completed:
Changed Files:
Commit SHA:
Tests Run:
Test Result:
Known Risks:
Unresolved Issues:
Required Next Agent:
Recommended Next Step:
Ready For Next Stage:
```

Test Result 仅 PASS / FAIL / NOT_RUN；Ready 仅 YES / NO。测试失败、未跑或阶段验收未满足时 Ready=NO。PASS+NO 不构成矛盾；说明尚缺什么。FAIL+YES、NOT_RUN+YES、缺字段、重复或互相冲突的字段必须拒绝。

另记 Branch、Checkpoint-Id、Checkpoint-Ref；语义遵循 [checkpoint](session-checkpoint.md)。Changed Files 列本次 checkpoint 的实际路径及类型（A/M/D，重命名按指定禁用 rename 检测的口径列 D+A），不列整个任务历史累计。普通状态同步尚未进入 checkpoint 封存流程时写 PENDING、Ready=NO，不把意图当最终事实。

checkpoint 封存例外：提交前必须把最终 handoff 纳入同一提交，因此可按已核验的实际暂存清单和当前阶段条件填写候选 Changed Files/Ready 值。此时它仍是待核验记录，不可对外宣称已完成或 SWITCH READY=YES；只有提交后核验与该记录完全一致，才成为可恢复 checkpoint。封存未成功则报告 NO 并保留现场；恢复方仍须独立核验完整 Git/状态/清单。

有证据支持迁移时，同时更新卡目录、卡正文、CURRENT_TASK、PROJECT_STATE、TASK_QUEUE 与 board。不要只移动目录。逐项复读最终文件，确认任务 ID 与状态六处一致；记录 Review、QA、Human 各自状态，不能从 Ready 推导三者通过。

未就绪时保留合法 blocked/failed 状态并说明原因，不自动清理文件或替用户接受。一次只能有一个当前 active 任务；并行项目先明确独立任务范围。

实际写入后重新核对这份最终 handoff，而不是验证旧样例。需要形成可恢复 Git 基线时继续执行 checkpoint；单写 handoff 不等于 checkpoint 成功。
