# 项目级技能

## 学术论文（ARS 技能包）

| 技能 | 描述 |
|------|------|
| `deep-research/` | 13-agent 深度学术调研（7 种模式） |
| `academic-paper/` | 12-agent 论文写作（10 种模式：大纲 / 摘要 / 引言 / 方法 / 实验 / 讨论 / 审稿回复 / 引用检查 / AI 套话过滤等） |
| `academic-paper-reviewer/` | 7-agent 同行评审模拟 |
| `academic-pipeline/` | 全流程编排：调研 → 写作 → 评审 → 修改 → 定稿 |

> 来源：academic-research-skills（CC-BY-NC-4.0），通用学术技能，非本项目专属。

## 项目本地补充

| 技能 | 描述 |
|------|------|
| `user-paper-style/` | **本项目**中文科技论文规范：证据强制校验 / 引用核查 / GB·T 7714 / 消融实验 / 术语同步。与 `academic-paper` / `academic-pipeline` 配合。 |

## 发现路径

1. 先读本文件与对应 `SKILL.md`。
2. 写论文时加载 `academic-paper` 或 `academic-pipeline`，同时加载 `user-paper-style` 获取项目特定规则。
3. 若 `skills/` 不可用，回退 `project_docs/agent_handoff/skill_snapshots/`。

## 规则

- 技能一旦变更，同步更新 `project_docs/agent_handoff/skill_snapshots/` 快照。
- 通用学术技能保持与上游同步；项目本地规则写在 `user-paper-style`。
