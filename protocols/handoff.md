# Handoff 协议 (P1)

> 位置: `<runtime-home>/legion/protocols/handoff.md`
> 规则: 所有 Agent 完成任务后**必须**生成标准 Handoff。Coding Agent 不得只说"任务完成。"

---

## 标准 Handoff 模板

```text
HANDOFF
Task ID:
Agent:
Runtime:          <由 Router 注入>
Model:            <由 Router 注入>
Provider:         <由 Router 注入>

Completed:        <完成了什么>
Changed Files:
  - <path>: <说明>
Commit SHA:
Tests Run:
Test Result:
Known Risks:
Unresolved Issues:
Required Next Agent:
Recommended Next Step:
Ready For Next Stage:   YES / NO
```

---

## 各字段要求

| 字段 | 要求 |
|------|------|
| Task ID | 与 Dispatch Package 一致 |
| Runtime/Model/Provider | 记录**实际**使用的（用于失败归因与成本核算）|
| Completed | 客观描述，不夸大 |
| Changed Files | 逐文件 + 一句话说明；越界文件必须显式标红 |
| Commit SHA | **本地** commit SHA（未 push）|
| Tests Run / Result | 跑了什么、结果如何；未跑要写"未跑+原因" |
| Known Risks | 已知风险，不能写"无"除非确实无 |
| Unresolved Issues | 未解决的问题（含 BLOCKED 原因）|
| Required Next Agent | 下一棒交给谁（reviewer / qa / 天枢 / Founder）|
| Ready For Next Stage | **YES/NO** —— 未达 DoD 必须 NO |

---

## 状态迁移（与 Task Lifecycle 联动）

```
Agent 完成 → 生成 Handoff → 天枢读取
  ├─ Ready=YES → Task 进入下一状态（code_review / qa / ...）
  └─ Ready=NO  → Task → blocked / failed，按 Escalation 处理
```

---

## 反模式（禁止）

- ❌ 只回"任务完成"/"已修复"
- ❌ Changed Files 与实际 diff 不符
- ❌ Ready=YES 但 AC 未过 / 测试未跑
- ❌ Handoff 中出现真实 Key / 凭据（一律 `[REDACTED]`）
- ❌ 越界改了文件却不声明
