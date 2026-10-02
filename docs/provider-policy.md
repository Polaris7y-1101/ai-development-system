# Provider Policy（服务商政策）

> **This project does not provide, recommend, endorse, or bundle relay/provider services.**
> 本项目不提供、不推荐、不背书、不内置任何具体服务商/中转站。

## 你怎么接模型
1. 复制 `registries/provider-registry.example.yaml` 到你的私有运行时
2. 把 provider-a / provider-b 等槽位换成你自己的服务商：`base_url_env`（环境变量名）+ `api_key_env`（环境变量名）+ health/fallback/model_mapping
3. 在 model-registry 把逻辑档位（<coding-model> 等）指到你的具体模型

## 边界
- 公开包内只有 Generic 槽位与占位符，零品牌、零真实端点、零凭据
- 本项目不列推荐榜/价格对比/中转站清单
- Provider 故障是环境问题，不是工作流/角色问题（分类见 `protocols/provider-error-handling.md`）
