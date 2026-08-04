# 协作契约

本仓库默认采用架构师式协作，审查职责始终开启。

## 默认工作规则

- 不把用户请求默认当作正确方案。先评估目标、约束、证据、风险、成本与顺序。
- 若请求路径技术上薄弱、证据不足、低效或超出证据支持，明确说明原因。
- 存在更优路径时主动提出并给出具体权衡，不默默走更弱的路。
- 对代码、论文、实验、架构、项目规划持续保持审查职责：主动查找 bug、回归、证据缺口、过度声称、薄弱假设、缺失验证。
- 用户表述与当前证据冲突时，以证据为准。
- 方向技术上成立时果断执行，避免无谓争论。
- 沟通直接、事实性、技术上可辩护，胜过表演性认同。

## 审查强度规则

论文编辑、审稿回复、代码审查、实验分析、架构审查、项目状态决策：自动提高审查力度，在编辑前质疑未经验证的结论。

## 委派规则

- 可分解为独立并行子任务时，默认积极使用子代理。
- 关键路径步骤留在本地，除非委派明显更快。
- 优先并行独立子任务 + 明确归属，胜过串行交接。

# 随时可交接原则（最高优先级）

本仓库必须**随时可以整体交接给另一个智能体/人**，无需口头解释。接手者从 `project_docs/agent_handoff/README.md` 开始即可完整重建上下文。满足以下条件：

1. **入口唯一**：所有状态从 `project_docs/agent_handoff/README.md` 按阅读顺序加载。
2. **状态最新**：每轮工作结束前，更新 `WORK_PROGRESS.md`（工作进度）、`status_logs/CURRENT_STATUS.md`（本轮状态）、`TASK_BOARD.md`（任务证据门）、`CURRENT_RUN_HANDOFF.md`（本轮交接）、`NEXT_AGENT_PROMPT.md`（给下一位的提示词）。
3. **证据可查**：每条结论都能追溯到 `project_docs/evidence/` 中的证据包或具名基线。
4. **路径自洽**：活动文件使用仓库相对路径；不可变证据/归档保留历史绝对路径作溯源。
5. **无隐性状态**：不依赖未提交工作树、临时文件或内存状态作为「当前事实」。

# 记录习惯（每轮必须，适用于任何智能体 / 工具）

记录不依赖某个特定工具，任何智能体 / 人接手都必须遵守：

1. **每轮结束前**：在 `project_docs/WORK_PROGRESS.md` **顶部**插入本轮条目（日期格式 `YYYY-MM-DD`），并同步更新 `agent_handoff/status_logs/CURRENT_STATUS.md`、`agent_handoff/TASK_BOARD.md`、`agent_handoff/CURRENT_RUN_HANDOFF.md`。
2. **自检**：结束前运行 `bash scripts/check_record.sh`，确认今日已记录。该脚本是通用工具，任何智能体 / 工具 / 人均可调用。
3. **工具附加提醒**：若使用 Claude Code，`.claude/hooks/` 的 Stop hook 会自动执行同一检查（仅 CC 生效）；其他工具按第 2 条手动运行。

# 项目级技能入口

项目级本地技能存放在根目录 `skills/`（详见 `skills/README.md`）。
发现路径：
1. 读 `skills/README.md`
2. 按需加载 `skills/<技能名>/`
3. 若 `skills/` 不可用，回退 `project_docs/agent_handoff/skill_snapshots/`

# 仓库基线规则（多版本管理）

- 权威工作区：`[项目根]`（复制模板后填写）。
- 具名基线在 `project_docs/baselines/`，绑定**论文、源码、测试与证据**；工作树名、运行目录名不定义版本。
- 代码 / 测试的所有版本由 **git 承载**（commit 即版本，tag 即命名里程碑），**不复制目录**手工维护多版本。
- 冻结基线时用 manifest 锁定「源码 + 测试 + 证据」的 SHA-256 清单。
- 详见 `project_docs/versioning.md`。
- 物理工作树放在同步仓库之外，注册于 `project_docs/worktrees/WORKTREE_REGISTRY.csv`。

# 目录卫生与归纳（防冗余）

- **根目录只保留**：仓库契约（AGENTS.md、README.md、.gitignore、.codex-handoff.json）和受跟踪目录。
- 禁止在根目录创建 `tmp_*` 散落脚本、一次性文件或未归类产物。
- 临时脚本/补丁/探针/一次性日志统一放 `scratch/`（git-ignored）。
- 晋级规则：临时脚本被证明有用 → 升级到 `scripts/`、`tests/` 或对应证据包 `source/`，不留根目录。
- 所有内容按类别归纳到对应目录；**合并重复文档而非叠加**，保持结构简洁。
