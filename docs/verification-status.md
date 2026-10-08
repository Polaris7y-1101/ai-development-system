# Verification status / 验证状态

Snapshot: 2026-10-09. Scope: the validation-hardening changes described under
[Unreleased](../CHANGELOG.md), based on v0.1.1. These results do not retroactively
apply the fixes to the published v0.1.1 package.

快照日期：2026-10-09。本页覆盖基于 v0.1.1 的待发布修复及限定范围的实机接力验收，不表示已发布包已包含这些改动。

## Who should try this / 适用人群

This is a developer preview for users comfortable with Git, runtime setup, and
dependency checks. It provides workflow references, templates, and offline demos.
The two top-level skills are wrappers, not a self-contained implementation bundle.

这是面向技术用户的开发者预览，适合评估工作流、模板和离线示例。
两个入口引用外部能力；只复制它们，不能保证完整工作流立即可用。
请先完成[安装与依赖检查](quick-start.md)。

## Evidence matrix / 证据矩阵

| Layer / 层次 | Result / 结果 | Scope / 能证明什么 |
| --- | --- | --- |
| Original baseline / 原版基线 | 11/11 PASS | Existing deterministic suite; new regressions exposed missing coverage / 原套件通过，但新测试发现旧缺陷 |
| Regression reproduction / 缺陷复现 | T12 and T13 failed before their fixes | Placeholder suppression and false CLOSED artifact reproduced / 先复现扫描漏检和任务未实际关闭 |
| Fixed local suite / 修复后本机套件 | 13/13 PASS | Includes 20 exact scanner cases and D1 artifact checks / 含精确命中与实际状态检查 |
| Offline demos / 离线示例 | 4/4 PASS | Deterministic simulations; no real runtime switch or human approval / 仅模拟 |
| YAML parsing / YAML 解析 | 10 files PASS | Syntax parsing only / 仅语法解析 |
| Codex discovery / 入口发现 | 2/2 PASS | Native skills/list returned enabled repository-scoped entries with no discovery errors / 原生发现成功 |
| Codex native sandbox disk reading / 原生沙箱正文及索引读取 | BLOCKED at last probe (2026-10-08) | Windows helper initialization failed; not retested as fixed by the WSL handoff / 最后一次原生探针失败，WSL 接力未证明它已修复 |
| Capability execution / 能力执行 | NOT VERIFIED | External implementations were not provisioned or executed by copying the wrappers / 复制入口没有安装或执行外部能力 |
| Live Hermes ↔ Codex round trip / 实机双向接力 | ADS-LIVE-001 accepted, 2026-10-09 | Same-task handoff through Codex host tools + WSL only; see scope below / 仅宿主工具＋WSL 同任务接力，范围见下文 |
| GitHub Actions | 3/3 PASS recorded for a85a2b1 | test-suite / boundary / yaml at the accepted code baseline; later changes need their own checks / 仅验收代码基线，后续变更需另验 |

Local environment: WSL Ubuntu, Python 3.14.4, PyYAML 6.0.3;
Codex CLI 0.162.0-alpha.2. The installation probe used a fresh project with existing
user configuration, not a new user account. No global skill installation was required.
The Codex session ended with exit code 0 despite failed file-read tools; that exit
code is not counted as a passing smoke test.

本机环境如上。安装验证使用新项目但保留原用户配置，不是全新账户测试。
会话正常结束不代表工具调用成功，因此没有把退出码 0 记为完整加载通过。

## Accepted handoff scope / 已验收的接力范围

ADS-LIVE-001 used commit `a85a2b10e19a26cffaae0121531996b7cd442c58`.
Hermes prepared the task and handoff; Codex read them, checked the same worktree,
branch, HEAD and clean status, ran the suite through host tools + WSL (13/13),
and wrote a return checkpoint. Hermes reported independent verification of the
return, input hashes, repository invariants and a disposable drift fixture.
The task record contains separate Review PASS, QA PASS and human acceptance,
recorded on 2026-10-09 at 00:21 CST (UTC+08:00); this scoped task is CLOSED.

ADS-LIVE-001 已完成任务卡 → Codex 宿主＋WSL 实读实跑 → 回程 checkpoint →
Hermes 独立复核 → 人工验收的闭环。测试前后工作树干净；漂移负例仅在一次性
fixture 中进行。此结论只覆盖上述提交、环境和任务范围。

Codex used CLI 0.162.0-alpha.2 with WSL Python 3.14.4; Hermes reported v0.14.0
with Python 3.11.15. The execution environments were not identical. Maintainer
task/checkpoint logs retain the detailed evidence privately; this page is a
scope summary, not a published raw audit bundle or a claim of reproducibility
on every installation.

This does not verify native Windows sandbox loading, installation on a new
account, or execution of all 26 capabilities. Codex remains **DRAFT**.
The handoff did not invoke and verify every indexed checkpoint/resume capability
individually. See the [capability acceptance checklist](capability-acceptance.md)
for the separate dependency and execution record.

原生沙箱问题、全新账户安装和 26 项能力执行均不在本次验收内。
完成接力流程不等于每个同名索引能力均已实际调用；适配器保持 **DRAFT**。

## Known limits / 已知限制

- Resolve `<runtime-home>` to the host's actual implementation locations and check
  dependencies individually. The index contains 26 capability entries; historical
  `VERIFIED_EXISTING` labels are not proof that they exist on a new user's machine.
- The generic boundary scanner still has existing source-region, environment-name,
  and public-path classifications. This fix addresses placeholder suppression;
  it does not establish comprehensive secret or Git-history scanning.
- Lifecycle vocabularies differ across existing protocol sources. D1 follows the
  public canonical demo state machine with REVIEW and QA. Choose and name the
  authoritative protocol before a real handoff; do not silently mix state names.
- Adapter documents contain historical project-validation claims. Those claims
  are not fresh-install acceptance for this revision. Codex remains DRAFT.

对应限制：外部路径需宿主配置；26 项能力的历史状态不代表新机器可用；
扫描器并非完整泄漏审计；协议状态名称尚未统一；历史适配器验证不能替代本次验收。

## Before broader adoption / 扩大试用前

1. The fixes were merged in PR #1. A future release needs its own authorization
   and verification; the accepted handoff does not publish a downloadable version.
2. Repeat skill discovery, full file reading, dependency resolution, and one small
   real task in the target runtime; record errors separately at each layer.
3. Use ADS-LIVE-001 as the accepted host + WSL handoff baseline. Repeat live
   acceptance when claiming support for another runtime path or changed behavior.
4. Keep independent review, QA, and human acceptance as separate verdicts.

扩大试用前仍需补齐目标环境安装与能力执行验收；发布需另行授权和核验。
宿主＋WSL 接力已验收，其他运行方式或行为变更需独立验收。
评审、QA 与人工验收继续分别记录，不从离线测试推断实机能力可用。

Feedback should include the package version, runtime version, failed layer,
reproduction steps, and redacted errors. Never post credentials, private paths,
or private project data. 反馈时请附版本、失败层次、复现步骤及脱敏错误。
