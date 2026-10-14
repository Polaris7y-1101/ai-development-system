# 本地项目交接技术预览

[English](technical-preview.md)

本预览面向已有 AI 开发助手、Git 和测试环境的技术用户。它将仓库事实核验、交接同步、checkpoint 和 resume 四项工作规范放进两个可完整复制的 Skill 目录，帮助不同会话依据项目文件接续工作。

版本为 `local-continuity-candidate-1`，不是 v0.1.1 或完整 26 能力版。已有根目录 `skills/` 是完整系统的引用入口；本预览位于独立目录，安装时二选一，不合并同名 Skill。规范由 AI 读取执行，不是自动强制执行的安全引擎。

## 下载与安装

使用本修订附带的 [ZIP](../previews/local-continuity-candidate-1/ads-local-continuity-candidate-1.zip)，或查看 [内容目录](../previews/local-continuity-candidate-1/README.md)。GitHub 文件页可选择下载原始文件。ZIP 的 SHA-256 应为：

```text
0d44dc07bca1ded8dac762c775f59a81b06ef2fc8122c194c43900e60ea92709
```

PowerShell：`Get-FileHash -Algorithm SHA256 -LiteralPath .\ads-local-continuity-candidate-1.zip`。摘要不符则停止。逐文件摘要见 [SHA256SUMS.json](../previews/local-continuity-candidate-1/SHA256SUMS.json)。

1. 阅读包内 README、LICENSE 和 NOTICE。候选包保留“未发布候选包”版本标识；本技术预览不将其改名为正式 Release。
2. 为已有运行时建立独立试用配置。运行时、模型账号和项目测试依赖由使用者自行准备，本包不包含凭据。
3. 只将 `previews/local-continuity-candidate-1/skills/` 下两个目录完整复制到该运行时支持的 Skills 目录。保留 references 子目录；如目标已有同名目录，停止，不覆盖。
4. 确认两个入口可见，并让助手读取入口及四项引用规范。此次 Hermes 发现检查使用 `hermes skills list`；列表可见不等于任务执行成功。

## 第一次任务

选择新建空测试目录，替换下列任务中的目录后交给助手：

> 仅在【填写授权测试目录】使用 ai-development-workflow 和 ai-software-legion。先读取入口、项目契约及四项规范，明确文件白名单，建立独立本地 Git 测试项目和基线。制作最小问候程序及实际可运行测试，补充 README 运行说明。运行真实测试，同步状态，归档旧交接，复读最终交接正文并核对暂存内容，然后另行生成本地 checkpoint。只允许测试目录写入及本地提交，不联网、不 push、不改其他项目、全局 Git 配置或已安装 Skill。没有发生的 Review、QA 和人工验收保持 OPEN。遇到权限、确认、Git 或路径问题就停止并报告，不把未执行写成通过。

如出现命令确认，检查具体命令和路径后使用运行时的正常交互确认。拒绝或超时应报告为阻塞，不关闭保护或永久放行以换取成功。

## 换会话核验

新会话取得同一测试项目的位置后，执行以下只读任务：

> 实际读取项目规则、任务、交接及 session-resume 规范，不依赖旧会话记忆。核对分支、HEAD、base、checkpoint 标记、改动清单、归档和状态，运行已记录的必要测试。给出能否继续、命令退出码及原因。不改文件、不提交、不推送；信息不足或存在冲突时停止。

Ready=YES 表示可交给指定下一角色，不代表人工验收完成。测试 PASS 而其他事项未就绪时，Ready=NO 合法，恢复仍应停止。不要在原正例里制造负例；另用授权的保留副本。

## 已验证范围与限制

2026-10-13 的隔离试用覆盖 Codex 小任务、独立四类负例、Hermes 接手任务和提交前复读补验。Hermes 最终状态与恢复条件的独立检查 18/18 通过；这不是 18 个业务场景，也不是所有流程普遍无误。2026-10-14 用户接受了该候选的限定范围结果。详见 [验证摘要](local-continuity-evidence.md)。

实际环境出现过裸 `python` 不可用而改用 `python3`、中文工作目录参数被运行时拒绝、非交互确认超时。补验完成不表示这些环境限制已经普遍解决。尚未验证干净系统从零安装、所有运行时、26 项完整能力、全部生命周期、真实外部看板或生产部署。

## 反馈

请使用 [反馈模板](local-continuity-feedback.md)，向仓库 Issues 提交脱敏后的复现步骤、候选摘要、运行时版本和必要输出。不要上传运行时配置、会话数据库、完整原始日志、密钥或私人项目。安全问题按 [贡献说明](../CONTRIBUTING.md) 的私密渠道处理。
