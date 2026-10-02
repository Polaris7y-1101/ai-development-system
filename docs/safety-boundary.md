# Safety Boundary（安全边界）

## 三类动作
| 类 | 含义 | 例 |
|---|---|---|
| AUTO_ALLOWED | 无需确认 | 读文件、跑测试、局部实现、写任务内文档 |
| HUMAN_APPROVAL_REQUIRED | 必须人批 | 生产部署、保护分支合并、破坏性迁移、生产数据删除、支付/资金操作、凭据轮换、force push |
| AUTO_FORBIDDEN | 永不自动 | 泄露凭据、绕过独立评审、在漂移未对账时继续执行、覆盖未知脏改 |

## 典型需人工确认清单
production deployment / protected branch merge / destructive migration / production deletion / payment & fund actions / credential rotation / force push

## 与工作流的关系
安全边界由 workflow 门禁强制执行（`presets/beidou/safety-boundary.md` + `protocols/task-lifecycle.md`）：门禁不是提示，是阻断。
