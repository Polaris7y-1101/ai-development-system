# AI Development System｜AI 项目接力工具包

**帮 AI 记清项目进度，换个对话也能先核对、再接着做。**

中文 · [English](README.en.md)

这是一个开源 Skills 项目。Skill 可以理解为“给 AI 助手看的操作说明”：让它把做了什么、测试结果和下一步记录在项目文件里，减少你切换对话时反复交代背景。

**目前开放小范围试用。** 需要已有能读写本地文件、执行命令的 AI 编程助手；不是独立聊天软件，也不是一键安装的完整开发系统。

## 从这里开始

| 你想做什么 | 点击这里 |
|---|---|
| 第一次试用，按步骤操作 | **[中文新手指南](docs/technical-preview.zh-CN.md)** |
| Read the step-by-step guide in English | **[English Guide](docs/technical-preview.md)** |
| 获取本次试用包 | **[下载试用包 ZIP](previews/local-continuity-candidate-1/ads-local-continuity-candidate-1.zip)** |
| 看已验证的内容和限制 | [试用验证摘要](docs/local-continuity-evidence.md) |

下载链接会打开 GitHub 文件页，点击 **Download raw file** 或下载图标即可。首次使用先看指南，再下载并核对文件。试用包不是旧 Release 的附件，不需要克隆整个仓库。

## 它解决什么问题？

你和 AI 做到一半，换了一个对话或助手，往往又要解释：“已经做了什么？测试过了吗？下一步是什么？”

本项目让 AI 按约定把这些信息留在项目里，下一位助手从实际文件和 Git 版本记录核对进度。有冲突就先停下来说明原因，帮助减少凭旧聊天记录猜测进度的情况。

例如：第一个对话写好一个小程序、运行测试并保存交接；第二个对话读取这些文件，核对后告诉你能否继续，以及还缺哪些步骤。

## 试用包里有什么？

| Skill | 负责什么 |
|---|---|
| `ai-development-workflow` | 核对项目实际情况、同步交接、保存工作存档点（checkpoint）、检查能否接手（resume） |
| `ai-software-legion` | 明确谁实现、谁独立评审、谁验证，以及哪些事情等你确认 |

一共两个 Skill 目录、四项本地操作规范。它们由 AI 读取执行，不会自动启动一支 AI 团队，也不是强制执行的安全程序。

## 适合谁？

- 已经在用本地 AI 编程助手，希望换对话时少解释一遍项目背景。
- 愿意先在新的练习项目里试用，并把不清楚或卡住的地方反馈回来。
- 已有或愿意准备 Git、Python 3；新手指南会让助手先检查环境。

如果你只有普通聊天界面，不能读写电脑里的项目文件或运行命令，需要先准备本地 AI 编程工具。模型账号、订阅或 API 使用费用由你使用的工具决定，本包不包含这些服务。

## 第一次怎么试？

1. 打开 [中文新手指南](docs/technical-preview.zh-CN.md)，确认需要的环境。
2. 下载、解压试用包，另建一个空的练习文件夹。
3. 按指南复制准备指令，让助手检查文件和环境，再安装到练习项目。
4. 让 AI 写一个输出 `Hello, ADS!` 的小程序，运行测试并保存交接。
5. 在同一个练习项目新开对话，让它只读核对上次进度和能否接手。

指南给出了具体目录、可复制的指令、成功结果示例和常见问题。不需要先理解所有技术术语；遇到权限或测试问题先停下，让助手说明原因。

## 当前进展与限制

试用包已做过小型本地任务、交接和恢复条件核验，并得到限定范围的人工验收；具体依据见 [验证摘要](docs/local-continuity-evidence.md)。当前提交的自动检查结果可查看 [GitHub Actions](https://github.com/Polaris7y-1101/ai-development-system/actions)。

仍需明确：

- 本包版本是 `local-continuity-candidate-1`，不是新的正式 Release。
- 尚未证明零基础用户能在干净电脑上从零完成安装，也未验证所有 AI 工具、全部 26 项能力或生产部署。
- 中英文使用指南都有；包内详细操作规范仍主要是中文。
- 测试通过不代表独立评审、QA 和人工验收都已完成；有缺项就如实保留。

先用练习项目体验，不要把试用结果直接当成真实项目的安全保证。

## 试用包和完整系统有什么区别？

| 内容 | 位置 | 建议 |
|---|---|---|
| 本页介绍的本地交接试用包 | `previews/local-continuity-candidate-1/` | 第一次试用从这里开始，两个完整目录一起使用 |
| 完整系统的引用包、协议和角色预设 | 根目录 `skills/`、`protocols/`、`registries/` 等 | 面向技术用户，需自行配置外部能力与运行环境 |

两者包含同名 Skill，**不要混装或覆盖已有版本**。完整系统的设计和适配器状态见 [文档目录](docs/README.md)、[完整引用包安装说明](docs/quick-start.md)和[验证状态](docs/verification-status.md)。本次试用不升级完整系统的适配器状态。

## 试用反馈与支持 ⭐

如果你觉得这个方向有用，欢迎登录 GitHub 后，点击仓库页面的 **Star ⭐**，方便以后找到项目，也给项目一点支持。点 Star 不是下载或试用的条件。

更欢迎告诉我们：**哪一步看不懂、哪里卡住、哪些地方帮到了你。** 可以使用 [反馈模板](docs/local-continuity-feedback.md) 到 [Issues](https://github.com/Polaris7y-1101/ai-development-system/issues) 提交问题。请隐藏密码、密钥、私人路径和私人项目资料，不上传完整聊天日志。安全问题按 [贡献说明](CONTRIBUTING.md) 走私密渠道。

## 更多资料

[文档目录](docs/README.md) · [贡献说明](CONTRIBUTING.md) · [更新记录](CHANGELOG.md) · [历史 Releases](https://github.com/Polaris7y-1101/ai-development-system/releases)

本项目不提供、不推荐或内置具体模型服务商/中转服务；服务连接由使用者自行配置，见 [Provider 政策](docs/provider-policy.md)。

## 许可证

Apache License 2.0，见 [LICENSE](LICENSE) 与 [NOTICE](NOTICE)。
