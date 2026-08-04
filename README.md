# Project-Structure-Template — 通用工程模板

> 本目录是**通用工程项目框架模板**，供后续所有工程类项目复制使用。
> 使用方法：整体复制本目录 → 重命名为实际项目 → 在 `[占位]` 处填写内容 → 按需裁剪。

## 项目简介

（一句话说明本项目是什么、解决什么问题。示例：本工程实现面向 XX 场景的 XX 系统，覆盖设计、实验、验证、论文全流程。）

- 项目类型：硬件 / 软件 / 算法 / 其他（择一）
- 主要技术栈：（例如 Verilog+Vivado、Python+PyTorch、Go+gRPC…）
- 当前阶段：（设计 / 开发 / 实验 / 论文 / 结题）

## 整体设计

（**此处必须详细描述整体设计**。新建项目时，把架构、模块划分、关键决策写在这里，或链接到 `src/DESIGN.md`。）

建议覆盖：

1. **系统架构**：分层与模块划分，输入输出流。
2. **核心模块**：每个模块的职责、关键接口、数据流。
3. **关键技术决策**：为什么选这个方案？记录为 ADR 时可链接到 `project_docs/design_specs/`。
4. **设计规范**：命名、编码风格、目录约定。
5. **边界与假设**：已知限制、暂不支持的场景、未来扩展点。

详细设计文档位置：

- `src/DESIGN.md` — 源码层设计（随代码演进）
- `project_docs/design_specs/` — 专项设计规范（如评审、变更触发）
- `docs/` — 技术文档（架构、指南）

## 最新进展

**当前权威状态入口：**

1. 工作进度（倒序记录）：`project_docs/WORK_PROGRESS.md`
2. 当前状态（最新一轮）：`project_docs/agent_handoff/status_logs/CURRENT_STATUS.md`
3. 任务看板（每步任务的证据门）：`project_docs/agent_handoff/TASK_BOARD.md`
4. 本周总结：`project_docs/reports/weekly/`

（更新本文档时，把「最新进展」小节同步到最近一轮记录，链接指向上述文件，不要在此重复粘贴全部内容。）

## 快速开始

（复制模板后按需填写）

1. 立项评估：填写 `project_docs/design_specs/PROJECT_PROPOSAL_TEMPLATE.md`（问题定义 + 创新性评估 + 可行性 / 风险），通过后再立项。
2. 登记项目：读 `project_docs/agent_handoff/START_HERE.md`，建立首个基线到 `project_docs/baselines/`。
3. 建立环境：按 `scripts/` 中的构建 / 验证脚本初始化。
4. 开发：在 `src/` 下按模块建目录，遵守 `src/DESIGN.md`。
5. 实验：在 `experiments/` 定义并编排，结果证据归 `project_docs/evidence/`。
6. 论文：默认写中文 `paper/zh/manuscript/`；仅投稿英文期刊 / 会议时才转换出英文版 `paper/en/manuscript/`。

## 目录角色

| 目录 | 角色 |
|------|------|
| `src/` | 主源码，按技术模块分子目录；`DESIGN.md` 记录源码层设计 |
| `paper/` | 论文 / 报告 / 成果；`zh/` 默认中文主版本，`en/` 英文转换版本 |
| `experiments/` | 实验定义与编排（**非结果存档**，结果证据归 `project_docs/evidence/`） |
| `data/` | 数据治理：`manifests/` `raw/` `derived/` `schemas/` |
| `project/` | 构建工程与运行配置；生成的工程文件 git-ignored，仅保留 `scripts/` |
| `project_docs/` | 项目过程文档：交接、基线、证据、进度、周报、设计规范、归档 |
| `docs/` | 技术文档（架构、规范、指南） |
| `scripts/` | 可复用脚本（python / shell 等） |
| `tests/` | 测试 |
| `skills/` | 项目级本地技能（供 Claude Code 等加载） |
| `scratch/` | 临时脚本 / 探针 / 一次性产物（git-ignored） |

## 工作规则

1. **版本定义**：论文与具名基线（`project_docs/baselines/`）共同定义「当前版本」；工作树名、运行目录名不定义版本。
2. **工作树**：一次性执行环境，物理位置在同步仓库之外，注册于 `project_docs/worktrees/WORKTREE_REGISTRY.csv`。
3. **结论口径**：每条结论区分「软件本地复现 / 策略复现 / 硬件复现 / 实测数据」，避免过度声称。
4. **证据自包含**：每个证据包含 README + 摘要 + 输入/来源 + 原始输出 + SHA-256 清单，见 `project_docs/evidence/README.md`。
5. **产物隔离**：生成产物放 git-ignored 的 `project/`、`scratch/`，绝不放在源码或主稿件旁。
6. **中英双版本**：论文以 `zh/` 为主版本；只有进入英文期刊流程时才维护 `en/`，两版结论必须一致。
7. **交接即承诺**：本轮结束前更新 `WORK_PROGRESS.md`、`CURRENT_STATUS.md`、`TASK_BOARD.md` 与 `CURRENT_RUN_HANDOFF.md`，按下一次接手者角度写明「下一步做什么、证据门是什么、不要做什么」。
