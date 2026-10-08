# Capability acceptance checklist / 能力逐项验收表

Prepared: 2026-10-09. Index baseline: `a85a2b1`.
Source: [capabilities.yaml](../skills/ai-development-workflow/capabilities.yaml).
This checklist separates index declarations, dependency observations and actual
execution. It does not upgrade adapter or capability declarations.

本表区分索引声明、依赖观测和真实执行。路径取自上述索引；本轮只整理清单，
没有重新探测外部运行时。25 项非空路径、1 项空路径是源码事实；
路径存在不代表可读取，能够读取不代表行为执行通过。

## Reading the table / 如何读表

- Declared / 声明：保留索引原值；`VERIFIED_EXISTING` 等标签不是本轮执行结果。
- Path / 路径：`UNCHECKED` 表示尚无本表可追溯的逐项运行时观测；
  `EMPTY_PATH` 表示索引未配置路径，不能归为已配置路径在磁盘不存在。
- Read / 读取：完整读取实际入口或必要文档才可记 PASS；`UNCHECKED` 为未验，
  `BLOCKED` 为缺少入口而无法验证。声明为文档/注册表的载体不应当作可执行程序。
- Execution / 执行：`NOT_RUN` 表示尚无逐项真实调用证据，不等于 FAIL。
  部分能力的实现由宿主和文档共同承载，必须明确实际执行路径。
- These observation labels describe evidence only. They are not new lifecycle
  states or replacements for the index's declared statuses.

Hermes reported 25 existing paths on 2026-10-08, but the retained discovery JSON
contains only aggregate counts, not 26 per-entry observations. Accordingly this
new table leaves individual runtime checks UNCHECKED; it does not erase the
historical aggregate report or claim those paths are absent.

Hermes 当时报告 25 个路径存在；现有 JSON 只有汇总，故不据汇总给每一行填写 PASS。
ADS-LIVE-001 验收的是[接力流程](verification-status.md)，没有逐一验证索引中
checkpoint、resume 等能力的调用来源和行为，不能自动填入本表的执行列。

## Entries / 26 项清单

Carrier types: skill directory / 技能目录; document / 文档; registry / 注册表;
none / 未配置。Exact implementation paths remain in the source index.

| Category | capability_id | Declared | Carrier | Path | Read | Execution |
| --- | --- | --- | --- | --- | --- | --- |
| task | requirement-to-task | VERIFIED_EXISTING | skill directory | UNCHECKED | UNCHECKED | NOT_RUN |
| task | task-state-management | PARTIAL | document | UNCHECKED | UNCHECKED | NOT_RUN |
| reality | repo-reality-check | VERIFIED_EXISTING | skill directory | UNCHECKED | UNCHECKED | NOT_RUN |
| reality | state-drift-detection | PARTIAL | skill directory | UNCHECKED | UNCHECKED | NOT_RUN |
| git | git-worktree-manager | VERIFIED_EXISTING | skill directory | UNCHECKED | UNCHECKED | NOT_RUN |
| routing | coding-agent-router | VERIFIED_EXISTING | skill directory | UNCHECKED | UNCHECKED | NOT_RUN |
| routing | model-router | PARTIAL | registry | UNCHECKED | UNCHECKED | NOT_RUN |
| routing | relay-provider-router | VERIFIED_EXISTING | skill directory | UNCHECKED | UNCHECKED | NOT_RUN |
| routing | relay-health-check | VERIFIED_EXISTING | skill directory | UNCHECKED | UNCHECKED | NOT_RUN |
| development | backend-development | VERIFIED_EXISTING | skill directory | UNCHECKED | UNCHECKED | NOT_RUN |
| development | frontend-development | VERIFIED_EXISTING | skill directory | UNCHECKED | UNCHECKED | NOT_RUN |
| development | api-contract | VERIFIED_EXISTING | skill directory | UNCHECKED | UNCHECKED | NOT_RUN |
| development | database-migration | VERIFIED_EXISTING | skill directory | UNCHECKED | UNCHECKED | NOT_RUN |
| gates | code-review-gate | EXTERNAL_BUILTIN | skill directory | UNCHECKED | UNCHECKED | NOT_RUN |
| gates | automated-test-gate | PARTIAL | skill directory | UNCHECKED | UNCHECKED | NOT_RUN |
| gates | qa-gate | PARTIAL | document | UNCHECKED | UNCHECKED | NOT_RUN |
| gates | security-secrets-gate | VERIFIED_EXISTING | skill directory | UNCHECKED | UNCHECKED | NOT_RUN |
| gates | scope-gate | PARTIAL | document | UNCHECKED | UNCHECKED | NOT_RUN |
| gates | human-acceptance-preparation | PARTIAL | document | UNCHECKED | UNCHECKED | NOT_RUN |
| memory | session-checkpoint | VERIFIED_EXISTING | skill directory | UNCHECKED | UNCHECKED | NOT_RUN |
| memory | handoff-state-sync | VERIFIED_EXISTING | skill directory | UNCHECKED | UNCHECKED | NOT_RUN |
| memory | session-resume | VERIFIED_EXISTING | skill directory | UNCHECKED | UNCHECKED | NOT_RUN |
| memory | project-memory-bootstrap | DRAFT | skill directory | UNCHECKED | UNCHECKED | NOT_RUN |
| memory | project-memory-audit | DRAFT | skill directory | UNCHECKED | UNCHECKED | NOT_RUN |
| release | release-rollback | VERIFIED_EXISTING | skill directory | UNCHECKED | UNCHECKED | NOT_RUN |
| release | release-preparation | MISSING | none | EMPTY_PATH | BLOCKED | NOT_RUN |

Declaration totals / 声明计数：15 VERIFIED_EXISTING、7 PARTIAL、1 EXTERNAL_BUILTIN、
2 DRAFT、1 MISSING，共 26 项。多项能力可能共享一个载体，不能从一个载体存在
推导其中所有能力已经执行通过。

## Evidence for each check / 逐项检查留痕

For each runtime, create a dated observation per capability before changing a
row. Include the following fields; repeat observations when the implementation,
runtime mapping or relevant behavior changes. Keep prior observations intact.

每个能力、每个运行时分别记录：

| Field / 字段 | Required evidence / 内容 |
| --- | --- |
| Identity / 身份 | capability_id、索引提交、实际实现版本或摘要、观测时间和运行时版本 |
| Resolution / 解析 | 明确的 runtime-home 映射、解析规则与入口类型；公开副本仅用占位符 |
| Path observation / 路径观测 | EXISTS、NOT_FOUND、INACCESSIBLE、EMPTY_PATH 或 UNCHECKED；保留错误原因 |
| Read observation / 读取观测 | PASS、FAIL、BLOCKED 或 UNCHECKED；实际入口及读取证据，不读取或公开凭据值 |
| Execution observation / 执行观测 | PASS、FAIL、BLOCKED 或 NOT_RUN；实际调用来源、范围、输入、预期结果、输出与退出状态 |
| Review / 复核 | 证据文件引用、独立核验者及结论；人工验收单独记录，不由执行者代签 |

Resolve `<runtime-home>` explicitly for each host. Do not guess it from a home
directory or assume a Hermes mapping works in Codex. For private registries,
record availability without exposing credentials or service endpoints; a
protected unread field remains unverified. Sanitized public records must omit
private absolute paths and project data.

## Historical classification correction / 历史分类差异

The 2026-10-08 Hermes aggregate used `missing=1, empty_path=0` with no per-entry
missing details. The source index instead has one unconfigured path:
`release-preparation`, declared MISSING with an empty implementation_path.
Future observations must count that as EMPTY_PATH separately from NOT_FOUND.
The original record is retained unchanged; the other 25 paths' current runtime
availability still requires the per-entry checks above.

这项纠正只针对路径分类，不增加实现、不升级状态，也不影响 ADS-LIVE-001 的
限定范围验收。空路径可以如实保留，不能补造实现来凑齐通过数量。

## Suggested first execution slice / 首批实测建议

Start with repo-reality-check, session-checkpoint, session-resume and
handoff-state-sync in a disposable, non-business fixture. Record the actual
capability invoked, a successful continuation and a drift rejection; a handwritten
simulation or an existing demo passing does not prove that the external capability
was invoked. This is a suggested next task, not an instruction to run every entry.

先测四项核心能力，并记录真实调用和失败边界。联网探活、数据库迁移、发布及回滚
等能力需要另定目标与授权范围，不批量执行。Review、QA、human acceptance 分开。
