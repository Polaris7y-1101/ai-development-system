---
name: ai-software-legion
description: AI Software Legion v0.1 顶层标准入口——军团结构导航、北斗(Beidou) Preset 说明、Custom Legion 组建与 Role 契约/公开 Provider 注册表模板。当用户提到 军团/legion/北斗编制/组建AI开发团队/Role契约/provider注册表模板 时使用。
version: 1.0.0
license: Apache-2.0
---

# AI Software Legion v0.1 — 顶层标准入口（Shell）

> **本 Skill 是壳（Wrapper），不是实体仓库。**
> 所有军团实体文件仍在 `<runtime-home>/legion/` 原地，本入口只做导航与标准说明。
> 原则：`Wrap / Reference / Standardize` 优先于 `Move / Rewrite / Reinstall`。

## 1. 结构导航（实体全部在 `<runtime-home>/legion/`）

### Core（7）
| 文件 | 作用 |
|---|---|
| `legion/README.md` | 军团总纲（v1.0 定型 + v0.1 标准化定位） |
| `legion/workflow.md` | 统一开发工作流（含规则 7 独立 Review 权威定义 / 规则 8 Worktree 归属引用） |
| `legion/safety-boundary.md` | 自动化安全边界（含自审禁令） |
| `legion/role-skill-matrix.yaml` | Role ↔ Skill 绑定矩阵（北斗恰 9 Role） |
| `legion/runtime-registry.yaml` | Runtime 注册表（claude-code / codex / hermes） |
| `legion/model-registry.yaml` | Model 注册表（env 名制，无 Key） |
| `legion/provider-registry.yaml` | Provider/Relay 注册表（**私有**，env 名制） |

### Roles（9，北斗编制，不扩编）
`legion/roles/00-tianshu-orchestrator.md` · `01-yaoguang-product-validation` · `02-tianxuan-architect` · `03-tianji-backend` · `04-tianquan-frontend` · `05-yuheng-qa` · `06-kaiyang-shipping` · `07-fuxing-experience` · `08-bixing-content`

### Protocols（5）
`legion/protocols/dispatch-package.md` · `task-lifecycle.md` · `handoff.md` · `ai-switch-protocol.md` · `provider-error-handling.md`

### 模板（1）
`legion/PROJECT_CONTEXT.template.md` — 项目上下文注入模板（通用军团 + PROJECT CONTEXT = 当前项目团队）

## 2. Beidou Preset（北斗预置军团）

- **编制**：9 Role + 5 Protocol + 4 Registry（runtime/model/provider/relay 自废弃后 3 registry + 指路条）
- **激活规则**：MVP 期常驻 4 人（天枢编排 / 天玑后端 / 天权前端 / 玉衡 QA），其余 5 星休眠按需唤醒
- **通信铁律**：Agent 间不直接通信，全部经天枢中转
- **解耦铁律**：`Role ≠ Skill ≠ Runtime ≠ Model ≠ Provider`——Persona 禁止写死 Claude/Codex/具体模型/Provider/Key
- **Runtime 分离**（Batch 2 冻结）：`Hermes != Orchestrator Role != 天枢`。北斗默认 Hermes 承载天枢，但禁止 `orchestrator = hermes` 硬绑定；Custom Legion 可由其他 Runtime 承载 orchestrator
- **项目记忆归属**：Project Memory belongs to Project/Repository；Runtime 切换不产生新 Project Truth

## 3. Custom Legion 组建（用本目录模板）

1. 复制 `templates/ROLE-CONTRACT.template.md` 逐角色填写（13 节契约，见模板内说明）
2. Provider 层用 `templates/provider-registry.PUBLIC.template.yaml`（匿名 provider-a/b 起步，按 env 名制接私有配置）
3. 项目差异全部走 `PROJECT_CONTEXT.md` 注入，**不改编制与协议**
4. 新军团目录建议 `<runtime-home>/legion-custom/<name>/`，引用本 skill 导航的协议与注册表，不复制第二套真相

## 4. 红线

- ❌ 不移动 / 不重写 `<runtime-home>/legion/` 任何实体（标准化一律走壳与引用）
- ❌ 不创建第二套 Registry / Matrix / Workflow
- ❌ 公开模板与文档禁止真实 Provider 名 / API Key / 私人 Base URL（用 provider-a/b、official-provider、relay-provider）
- ❌ 北斗保持 9 Role，不加第 10 个常驻角色（MIG-001 规则 7）
