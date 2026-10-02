# Safety Boundary（自动化安全边界）

> 位置: `<runtime-home>/legion/safety-boundary.md`
> 原则: **AI 可在本地自由迭代；凡触及"正式/生产/资金/权限/不可逆"，必须 Founder 确认。**
> 不确定风险 → 默认要求 Founder 确认。

---

## ✅ AI 可自动执行（无需逐次确认）

- 读取项目 / 分析代码
- 建 Task
- 建 branch
- 建 worktree
- 修改**任务白名单内**代码
- lint / build / local tests
- **local commit**
- Code Review
- QA
- Bug Fix
- Regression

## 🔴 必须 Founder 确认

- merge 正式主分支
- push 正式远程分支
- production deployment
- destructive migration
- 删除正式数据
- 修改生产支付
- 修改正式资金配置
- 修改生产权限
- force push
- 删除备份
- 删除远程分支
- revoke / rotate credential

---

## 硬性底线（禁止）

- ❌ 不在 Prompt / Persona / Markdown 保存真实 Key
- ❌ 不输出真实密钥（一律 `[REDACTED]`）
- ❌ 不把凭证提交 Git
- ❌ 不在主工作树直接开发
- ❌ 不绕过 Review / QA
- ❌ Developer 自审冒充 Final Independent Review（MIG-001：reviewer != implementer，缺合格独立 Reviewer 时 `REVIEW_INDEPENDENCE_MISSING` 阻断而非放行）
- ❌ 不允许 Coding Agent 自行扩大 Scope
- ❌ 不自动 destructive 操作

---

## 与 config 的关联

- `<runtime-home>/config.yaml` → `security.tirith_fail_open: true` ⚠️ **仍是待治理风险项**（扫描器失败即放行）
- `security.redact_secrets: true`
- `approvals.mode: manual`

## 判定流程

```
动作是否在「可自动」清单？
  ├─ 是 → 执行
  └─ 否 → 是否在「必须确认」清单？
            ├─ 是 → 请求 Founder 确认
            └─ 不确定 → 默认请求 Founder 确认
```
