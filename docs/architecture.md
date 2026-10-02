# Architecture（架构）

## 五个正交概念（互不相等）

| 概念 | 是什么 | 例子 | 变更影响 |
|---|---|---|---|
| **Role** | 军团里的职责位 | backend / qa / security | 只改军团配置 |
| **Workflow Capability** | 工作流能力 | code-review-gate / qa-gate | 由能力索引声明 |
| **Runtime** | 执行 AI 的程序 | Hermes / Claude Code / Codex | 换适配器，不改角色/工作流 |
| **Model** | 逻辑模型档位 | <coding-model> / <daily-model> | 换模型不动 Persona |
| **Provider** | 模型服务来源 | 你自配的任意兼容服务商 | 换服务商零代码变更 |

```
Role != Workflow Capability != Runtime != Model != Provider
```

## 分层（不要求严格串行绑定）

```
Human（审批边界：AUTO_ALLOWED / HUMAN_APPROVAL_REQUIRED / AUTO_FORBIDDEN）
  ↓ 指挥/批准
Legion（角色 + 责任覆盖；预设可改名/禁用/增删）
  ↓ 承担
Workflow（生命周期 + 门禁 + 证据规则；核心规则不因军团配置而变）
  ↓ 执行于
Runtime（适配器契约；可替换、可并存）
  ↓ 调用
Model（逻辑档位，无品牌）
  ↓ 由
Provider（Generic Registry 槽位，用户自配）
```

任何两层之间都是**引用而非绑定**：例如角色通过能力名引用工作流能力，通过逻辑档位引用模型——永不写死具体品牌、路径或凭据。
