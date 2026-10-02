# Contributing

## Workflow
1. 建/认领一个 scoped task（小而清晰；先读 `docs/quick-start.md` 六件套约定）
2. 分支：`feature/*` / `fix/*` / `docs/*`
3. 实现 + 本地测试：`python3 tests/run_tests.py` 必须全绿
4. PR：按模板填写 What/Why/Scope/Tests/Evidence/Breaking/Security impact/Docs impact

## Rules
- **Evidence-based**：声称 ≤ 证据；状态只允许 VERIFIED / PARTIAL / DRAFT / TO_BUILD / DEGRADED，不许为好看标 VERIFIED
- **Provider neutrality**：任何内容不得出现具体服务商/中转站推荐或品牌绑定；用 provider-a/b 槽位
- **Public boundary**：禁止提交凭据、私有路径、私有项目数据；boundary-scan 是硬门
- **No marketing inflation**：world's first / best / revolutionary 类词禁用
- 安全问题：勿开公开 issue 详述，走 security issue template 指引的私密渠道
