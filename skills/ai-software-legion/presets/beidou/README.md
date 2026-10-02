# 北斗 AI 软件开发军团 · 定型总纲

> 位置: `<runtime-home>/legion/README.md`
> 版本: v1.0 (定型) / **AI Software Legion v0.1 标准化入口已建立**
> 原则: **Role ≠ Skill ≠ Runtime ≠ Model ≠ Provider** —— 全部可插拔。

> **v0.1 标准化定位（Wrap，不 Move）**：
> 本目录实体文件保持原地不动。顶层标准入口在 `<runtime-home>/skills/ai-software-legion/SKILL.md`（导航壳 + Beidou Preset 说明 + Custom Legion 模板 `templates/ROLE-CONTRACT.template.md`、`templates/provider-registry.PUBLIC.template.yaml`）。公开模板与私有 Registry 物理分离：模板在 skill 目录（匿名），私有配置在本目录（env 名制）。

---

## 一、总公式

```
通用北斗军团  +  PROJECT CONTEXT  =  当前项目开发团队
```

- **通用军团**（本目录）：角色核心、注册表、协议、技能——**与项目无关**。
- **PROJECT CONTEXT**（项目根 `PROJECT_CONTEXT.md`）：技术栈、白名单、真相源、项目坑——**注入细节**。
- 同一套军团可开发：微信小程序 / App / Web / Backend / 其他软件。

---

## 二、四层解耦

```
Agent 角色 (Role)  ≠  Skill  ≠  Coding Runtime  ≠  Model  ≠  Provider/Relay
      │                │              │              │            │
   roles/            skills/    runtime-registry  model-registry  provider-registry
      │                │              │              │            │
   "怎么工作"       "怎么做"      "谁来执行"       "用哪个脑"     "走哪个站"
```

**禁止**在 Persona 中写死：具体模型品牌 / 具体版本 / Provider / Relay / Base URL / API Key（Runtime adapter 名与模型配置解耦，见 registries/）。
Persona 只定义「这个角色应该怎么工作」。

---

## 三、编制（9 角色，不再新增常驻）

| 星名 | 角色 | 核心 |
|------|------|------|
| 天枢 | AI COO/CTO/Orchestrator | 编排全局，**默认不写业务代码** |
| 瑶光 | Product Validation | 价值/场景/MVP/Scope/AC |
| 天璇 | Software Architect | 只设计，不写码 |
| 天玑 | Backend Engineer | 只写后端 |
| 天权 | Frontend Engineer | 只写前端 |
| 玉衡 | QA Engineer | 只测试 |
| 开阳 | DevOps/Shipping | 构建/发布/回滚 |
| 辅星 | UX Reviewer | 只给体验建议 |
| 弼星 | Content Agent | 只产内容 |

角色核心：`roles/`
铁律：**Agent 间不直接通信，全部经天枢中转。**

---

## 四、目录结构

```
<runtime-home>/legion/
├── README.md                     ← 本文件（总纲）
├── roles/                        ← 通用角色核心（9 个，project-agnostic）
├── runtime-registry.yaml         ← RUNTIME_REGISTRY
├── model-registry.yaml           ← MODEL_REGISTRY
├── provider-registry.yaml        ← PROVIDER_REGISTRY
├── relay-registry.yaml           ← RELAY_REGISTRY（已自废弃，指路条）
├── role-skill-matrix.yaml        ← ROLE_SKILL_MATRIX
├── PROJECT_CONTEXT.template.md   ← 项目上下文模板
├── workflow.md                   ← 统一开发工作流
├── safety-boundary.md            ← 自动化安全边界
└── protocols/                    ← 协议
    ├── dispatch-package.md
    ├── handoff.md
    ├── task-lifecycle.md
    ├── ai-switch-protocol.md
    └── provider-error-handling.md
```

---

## 五、调用方式（Founder 视角）

Founder 只需对天枢说：**"开发某个功能。"**

天枢自动：
```
理解需求 → 调角色(roles) → 调 Skill(matrix) → 选 Runtime → 选 Model
→ 选 Provider → 开发 → Review → QA → 返工 → 提交 Founder 验收
```

Founder **不再手动复制 Agent Prompt**。

---

## 六、可插拔资源

| 资源 | 换它时要改 | 不用改 |
|------|-----------|--------|
| Runtime | `runtime-registry.yaml` | Persona / Skill |
| Model | `model-registry.yaml` | Persona / Skill |
| Provider | `provider-registry.yaml` | Persona / Skill |

> 换模型 / 换中转站 = 只改注册表 + 环境变量。**Agent 人格不动。**

---

## 七、相关 Skill（13 个，P1 建立）

调度：`coding-agent-router`、`relay-provider-router`、`relay-health-check`
流程：`requirement-to-task`、`repo-reality-check`、`git-worktree-manager`、`handoff-state-sync`
工程：`frontend-development`、`backend-development`、`api-contract`、`database-migration`、`security-secrets-gate`、`release-rollback`

绑定关系见 `role-skill-matrix.yaml`。
