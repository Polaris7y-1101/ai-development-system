# PROJECT CONTEXT — 模板

> 位置: `<runtime-home>/legion/PROJECT_CONTEXT.template.md`
> 用法: 复制到项目根 `PROJECT_CONTEXT.md`，填入项目细节。
> 原则: 军团角色核心（`roles/`）保持通用；**所有项目细节在此注入**。

---

## 公式

```
通用北斗军团（roles/ + registries/ + protocols/ + skills）
            +
PROJECT CONTEXT（本文件）
            =
当前项目开发团队
```

同一套军团应能开发：微信小程序 / App / Web / Backend / 其他软件项目。

---

## 1. 项目标识

```yaml
project_name: <名称>
project_id: <slug>
repo_canonical: <仓库根绝对路径>
repo_remote: <远程 URL（不含凭据）>
platforms: [微信小程序 | App | Web | Backend | ...]
```

## 2. 技术栈

```yaml
frontend: <框架/语言/约定>
backend:  <运行时/框架>
data:     <数据存储 + 唯一真相源>
build:    <构建/运行方式>
ports:    <本地端口>
```

## 3. 目录与真相源

```yaml
source_of_truth:      <数据的唯一真相源>
single_big_files:     [<需特别小心的单文件>]
generated_or_mirrors: [<副本/镜像，易漂移>]
```

## 4. 角色实例化（白名单 / 边界）

> 通用角色核心 + 本项目具体白名单。

```yaml
tianji-backend:
  allowed_files: [<后端白名单>]
  forbidden_files: [<前端/配置>]
tianquan-frontend:
  allowed_files: [<前端白名单>]
  forbidden_files: [<后端/配置>]
tianxuan-architect:
  docs_dir: <设计文档目录>
```

## 5. 项目约定

```yaml
code_style:   <缩进/引号/命名>
api_style:    <RPC/REST 约定>
commit_style: <提交规范>
docs_dir:     <文档目录>
tasks_dir:    <任务目录>
reports_dir:  <报告目录>
```

## 6. 项目特有的坑（Pitfalls）

- ...

## 7. 项目安全边界补充

- 生产环境标识
- 支付/资金相关文件（禁改）
- 需 Founder 确认的额外动作

## 8. 当前阶段

```yaml
phase: <如 MVP / 迭代 N>
current_task: <TaskID 或路径>
```

---

**注意**：本文件**不含**任何 Key / Base URL / Provider 域名。运行参数由注册表 + 环境变量注入。
