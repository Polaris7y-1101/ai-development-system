# Local continuity validation summary / 本地交接验证摘要

This summary concerns only `local-continuity-candidate-1`. It does not upgrade the root package, adapters or historical task verdicts. 本摘要只适用于独立候选包，不升级根目录完整系统及历史任务状态。

| Evidence / 证据 | Scope / 范围 |
|---|---|
| Package identity | 12 payload files; ZIP also contains SHA256SUMS.json. ZIP SHA-256: `0d44dc07bca1ded8dac762c775f59a81b06ef2fc8122c194c43900e60ea92709` |
| Discovery | Two entries found in an isolated configuration of an existing Hermes installation |
| Codex task | Actual small local implementation and tests, followed by independent checkpoint/resume inspection |
| Negative cases | FAIL+YES, PASS+NO, omitted changed file, and state conflict checked in separate copies using an independent helper; the helper is not bundled enforcement |
| Hermes task, 2026-10-13 | Consumed the Codex project checkpoint, updated README, ran tests and created a new checkpoint; original Skill-return content matched the candidate files |
| Directed retest | A missing pre-commit reread record in the first run was preserved; a separate retest recorded the final reread and staged checks before the subsequent commit |
| Final review | 18/18 final-state and resume-condition checks passed; not a claim of 18 independent business scenarios |
| Human acceptance, 2026-10-14 | Accepted within the stated local candidate scope, separately from publication authorization |

The directed retest required normal interactive approval of one specific command. Earlier confirmation timeouts and failed attempts were retained, not relabeled as successful runs. Tests used a preconfigured environment and a small isolated project. They do not prove fresh-install readiness, unsupervised safety, full lifecycle coverage or universal runtime support.

首次流程缺口通过新副本定向补验，不追认首次执行已完整合规。Review、QA、人工验收分别记录；本候选验收不替代旧任务缺失的原始证据，不宣称原生沙箱问题已修复。私人原始日志与会话数据库不随公开包分发，读者可按试用指南在自己的隔离项目复验。

The candidate includes newly composed local instructions and preserves the public project's Apache-2.0 LICENSE and NOTICE. It does not include private Skill source files, private runtime settings or raw session evidence. This summary is not an exhaustive upstream provenance audit.
