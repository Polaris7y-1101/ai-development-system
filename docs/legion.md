# AI Software Legion（AI 软件军团）

## 角色模型
军团 = 角色集合 + 责任覆盖矩阵（required_coverage）。**Display Name != Stable Role ID**：显示名随便改，引用永远走 role_id。

## 北斗九星（默认预设，非强制）
orchestrator（调度/审核/合入）· product（产品验证）· architect（设计/独立评审默认人选）· backend · frontend · qa（独立 QA）· shipping · experience · content。预设位置：`skills/ai-software-legion/presets/beidou/`。

## 自定义三式（演示：`examples/custom-legion/`）
- **Rename**：改 display_name，role_id 不变 → 所有引用不断
- **Disable**：禁用角色后重算覆盖 → 缺口显式报警（禁 QA 得 `QA_COVERAGE_MISSING`，**不会**自动认为 QA 不重要）
- **Add**：新增角色（如 security）→ 覆盖矩阵重算；Workflow Core 零修改

## 红线
角色契约（`templates/ROLE-CONTRACT.template.md`）永不写死：模型品牌、Provider、Base URL、API Key、具体 Runtime。
