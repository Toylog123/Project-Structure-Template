# 项目级技能

存放本项目专用的技能包（供 Claude Code 等智能体加载，如 `skills/<技能名>/SKILL.md`）。

发现路径：

1. 先读本文件。
2. 按需加载 `skills/<技能名>/`。
3. 若 `skills/` 不可用，回退 `project_docs/agent_handoff/skill_snapshots/`。

规则：

- 技能包描述本项目的**专属**工作流（实验规则、论文风格、硬件流程等），通用知识放用户级技能。
- 技能一旦变更，同步更新 `skill_snapshots/` 快照。
