---
name: ai-software-legion
description: Use when assigning implementation, independent review, QA, and human ownership for a local AI project handoff. 使用于本地任务的角色分工与独立验收职责划分。
license: Apache-2.0
---

# AI Software Legion — continuity candidate

此入口在本地接力候选包中负责分工，不启动多代理、不安装模型、不自动挑选 Provider。完整项目的北斗预设未被修改；本候选包仅提供完成最小接力任务所需的责任约定。

读取 [角色契约](references/roles.md)，再指定谁实现、谁独立 Review、谁 QA、谁拥有人工验收决定。可以使用当前运行时已有工具，或准备交接交给其他人/会话；若缺独立评审者，明确记录 Review=OPEN，不能由实现者冒充。

流程由旁边安装的 [ai-development-workflow](../ai-development-workflow/SKILL.md) 负责。安装时必须复制两个完整目录；路径不存在就报告安装缺项。

角色名称可自定义；职责、角色身份与证据来源必须明确。Model/Provider 不写死，未知时如实标 UNKNOWN。任务级模型输出不构成用户验收。
