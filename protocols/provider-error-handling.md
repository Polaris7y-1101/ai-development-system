# Provider 故障处理协议 (P1)

> 位置: `<runtime-home>/legion/protocols/provider-error-handling.md`
> 由 `relay-provider-router` 执行。**禁止无限重试。**

---

## 错误分类 → 处理动作

```text
401 / invalid key
  → 不重试
  → Provider 标记 unhealthy
  → 有 fallback 则切；无则 → Task blocked

403
  → 权限问题
  → 不盲目重试
  → 记录 + 升级天枢（可能 key 权限不足）

429 (rate limit / quota)
  → 区分两类：
    · "请等待 N 秒" 字样 = 临时限流 → 严格串行等待后重试（有 fallback 可先切）
    · "无效的令牌"（无等待字样）= key 永久吊销 → 不重试，需人工换 key
  → 有 fallback 时切换；无则 → Task blocked

5xx
  → 有限次数重试（≤2）
  → 仍失败 → 切 fallback
  → fallback 也失败 → Task blocked

timeout
  → 有限次数重试（≤2）
  → 判断 Provider 状态 → 切 fallback

model unavailable / model_not_found
  → 切合法映射模型（查 relay-registry.yaml model_tiers）
  → 仍失败 → 切 fallback Provider
```

---

## 重试与切换记录（每次必填，落盘）

```
Task ID:
Runtime:
原 Provider / 原 Model:
错误类型:      401 | 403 | 429 | 5xx | timeout | model_unavailable
错误原文:      [REDACTED if needed]
Retry 次数:
切换动作:      fallback / 换模型 / 停止
最终 Provider / 最终 Model:
最终结果:      成功 / blocked / failed
```

记录位置：`<project>/reports/PROVIDER-FAILURES.md`（追加）

---

## 硬性规则

1. **禁止无限重试**：每类错误都有上限（5xx/timeout ≤2 次）。
2. 401/403 **不重试**（重试无意义且可能触发风控）。
3. 429 必须先区分"临时限流"与"key 吊销"。
4. 每次切换/重试**必须记录**。
5. 并行上限：同一 relay 最多 1–2 个并发 Coding Agent（超出易触发 429/吊销）。
6. 任何 Key 操作只经环境变量；协议/日志中 **不含真实 Key**。

---

## 与 Task Lifecycle 联动

```
Provider 故障且无可用 fallback → Task → blocked（原因=Provider unhealthy）
切换后成功                     → Task 继续当前状态
切换后仍失败                   → Task → failed（原因=Provider exhausted）
```
