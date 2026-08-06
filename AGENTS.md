# 行为准则

## 1. 质疑优先（Challenge-first）

任何请求、方案、结论、数字在验证之前都是**待检验假设**，不因来源而自动采信。

| 怎么做 | 不要做 |
|--------|--------|
| 执行前先独立评估目标、约束、证据、风险与顺序 | 因用户/上级/主流/既有代码/历史结论而跳过评估 |
| 发现薄弱、证据不足或更优路径时，附具体依据说明 | 空泛否定或默默执行 |
| 证据与既有结论冲突时，以证据为准 | 为维持一致性而忽略新证据 |
| 对自身产出同样保持审查：找错误、缺口、过度声称 | — |

## 2. 质量不打折

| 怎么做 | 不要做 |
|--------|--------|
| 硬件/关键设计实施前先评审，确认目标与约束再动手 | 跳过评审直接编码 |
| 默认追求更稳、更快、更清晰的实现 | 满足于"能跑" |
| 需要时大改/重构/重写，力度服从质量需要 | 因害怕修改而只做小修小补 |
| 论文困难时以完善设计、补足实验来提升 | 用弱化声明、缩小范围来应付 |
| 降级是最后手段，须说明原因、影响与恢复路径 | 因时间/便利而轻易降低目标 |

## 3. 记录与经验

| 怎么做 | 路径/命令 |
|--------|----------|
| 每轮结束前更新进度（顶部插入） | `project_docs/WORK_PROGRESS.md` |
| 同步更新本轮状态 | `project_docs/agent_handoff/status_logs/CURRENT_STATUS.md` |
| 同步更新任务证据门 | `project_docs/agent_handoff/TASK_BOARD.md` |
| 同步更新本轮交接 | `project_docs/agent_handoff/CURRENT_RUN_HANDOFF.md` |
| 给下一任写提示词 | `project_docs/agent_handoff/NEXT_AGENT_PROMPT.md` |
| 运行记录自检确认今日已记录 | `bash code/scripts/check_record.sh` |
| 解决任何问题后登记经验 | `docs/EXPERIENCE.md`（现象→原因→解决→验证） |

# 工程纪律

## Git

| 时机 | 动作 |
|------|------|
| 阶段性工作完成（功能门/实验包/论文一轮） | `git commit` + `git push` |
| 里程碑成果（对应基线） | `git tag <基线ID>` |
| 重大改动/重构/实验切换前 | 先 commit 或 tag 固化当前状态，保证可回退 |

## 版本隔离

| 规则 | 说明 |
|------|------|
| 版本完整体 | 每版本自包含 `code/`+`project/`+`experiments/`+`docs/` |
| 零交叉引用 | 禁止新版本引用旧版本文件（含脚本）；需要就复制 |
| 冻结流程 | 阶段完成→打基线+tag→完整复制进 `versions/<基线ID>/` |
| 主目录=最新 | 根 `code/` 等始终是当前最好版本 |
| 详见 | `project_docs/versioning.md` |

## 目录卫生

| 放哪里 | 什么内容 |
|--------|----------|
| 根目录 | 仅 `AGENTS.md` / `README.md` / `.gitignore` / `.codex-handoff.json` + 受跟踪目录 |
| `scratch/` | 临时脚本/补丁/探针（git-ignored） |
| `code/scripts/` | 证明有用的脚本晋级到此 |
| `code/tests/` | 测试 |
| `code/src/` | 源码（按模块） |
| `project_docs/` | 文档合并同类项，不叠加重复 |

## 文档同步

结构/路径变更后**同一次提交**内更新对应文档：`README.md`（目录角色+快速开始）、`AGENTS.md`、`.codex-handoff.json`、`project_docs/versioning.md`（涉版本时）。

# 接手者入口

从 `project_docs/agent_handoff/README.md` 开始，按阅读顺序加载全部上下文——仓库须随时可无口头交接。
