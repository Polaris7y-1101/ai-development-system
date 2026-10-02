# Dispatch Package 协议 (P1)

> 位置: `<runtime-home>/legion/protocols/dispatch-package.md`
> 规则: 天枢派给任何 Coding Agent（Claude Code / Codex）前，**必须**先构建并落盘一份 Dispatch Package。
> 非 Dispatch Package 的裸 Prompt 一律不允许启动 Coding Agent。

---

## 模板

```yaml
DISPATCH_PACKAGE:
  Task ID:          T<YYYYMMDD>-<NN>-<slug>
  Role:             backend | frontend | architect | qa | shipping | content | experience | product-validation
  Goal:             <一句话目标>
  Scope:            <IN: 做什么>
  Out of Scope:     <OUT: 明确不做什么>
  Acceptance Criteria:
    - <可测的 AC 1>
    - <可测的 AC 2>
  Canonical Repo:   <仓库根绝对路径>
  Branch:           <目标分支，如 task/T...-slug>
  Worktree:         <隔离工作树绝对路径>
  HEAD:             <进入前的 commit SHA>
  Allowed Files:    [<白名单路径>...]
  Forbidden Files:  [<禁改路径>...]
  Required Context: [<Persona 路径>, <≤3 docs>, <相关源码>]
  Required Skills:  [<skill...>]
  Runtime:          claude-code | codex      # 由 coding-agent-router 决定
  Model:            <由 Model Router 决定>
  Provider:         <由 relay-provider-router 决定>
  Quality Gate:     <该角色对应的 quality gate>
  Definition of Done:<该角色对应的 DoD>
  Handoff Target:   <下一个接收者>
  Escalation Rules: <失败/阻断时的升级路径>
```

---

## 构建检查清单（天枢在派单前逐项确认）

- [ ] Task ID 唯一且在 `tasks/` 有对应文件
- [ ] Role 与 Persona 匹配
- [ ] Scope / Out of Scope 都写明（Out of Scope 非空）
- [ ] AC 可测（非"保证质量"这类空话）
- [ ] Canonical Repo / Branch / Worktree / HEAD 已确认
- [ ] Allowed Files 是**精确路径**，不含通配大目录
- [ ] Runtime 由 coding-agent-router 给出，**非写死**
- [ ] Provider 由 relay-provider-router 给出，**非写死**，且有 fallback
- [ ] 已跑 relay-health-check（primary 可用）
- [ ] Persona 内**无**任何 Key / Base URL

---

## 落盘位置

```
<project>/tasks/active/<TaskID>.md      # 运行中
<project>/tasks/dispatch/<TaskID>.yaml  # 机器可读副本（可选）
```

---

## 反模式（禁止）

- ❌ 直接复制一段 prompt 就启动 Claude Code（无 Task ID / 无 AC / 无白名单）
- ❌ Dispatch Package 内写死 Provider / Base URL / Key
- ❌ Allowed Files 写成 `src/**` 这类大范围
- ❌ 不设 Out of Scope（导致 Scope 蔓延）
