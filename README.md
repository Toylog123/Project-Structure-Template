# 通用工程模板

> 本目录是**通用工程项目框架模板**，供后续所有工程类项目复制使用。
> 使用方法：整体复制本目录 → 重命名为实际项目 → 在 `[占位]` 处填写内容 → 按需裁剪。
> 移植已有项目：见 `project_docs/migration/FRAMEWORK_MIGRATION_GUIDE.md`。

## 项目简介

（一句话说明本项目是什么、解决什么问题。示例：本工程实现面向 XX 场景的 XX 系统，覆盖设计、实验、验证、论文全流程。）

- 项目类型：硬件 / 软件 / 算法 / 其他（择一）
- 主要技术栈：（例如 Verilog+Vivado、Python+PyTorch、Go+gRPC…）
- 当前阶段：（设计 / 开发 / 实验 / 论文 / 结题）

## 整体设计

（**此处必须详细描述整体设计**。新建项目时，把架构、模块划分、关键决策写在这里，或链接到 `code/src/DESIGN.md`。）

建议覆盖：

1. **系统架构**：分层与模块划分，输入输出流。
2. **核心模块**：每个模块的职责、关键接口、数据流。
3. **关键技术决策**：为什么选这个方案？记录为 ADR 时可链接到 `project_docs/design_specs/`。
4. **设计规范**：命名、编码风格、目录约定。
5. **边界与假设**：已知限制、暂不支持的场景、未来扩展点。

详细设计文档位置：

- `code/src/DESIGN.md` — 源码层设计（随代码演进）
- `project_docs/design_specs/` — 立项评估与专项设计规范
- `docs/` — 技术文档（环境、术语、经验）

## 最新进展

**当前权威状态入口：**

1. 工作进度（倒序记录）：`project_docs/WORK_PROGRESS.md`
2. 总工作日志（正序，可回溯）：`project_docs/LOGS.md`
3. 当前状态（最新一轮）：`project_docs/agent_handoff/status_logs/CURRENT_STATUS.md`
4. 任务看板（每步任务与证据门）：`project_docs/agent_handoff/TASK_BOARD.md`
5. 未决问题（未解决持续保留，必须告知）：`project_docs/OPEN_ISSUES.md`
6. 本周总结：`project_docs/reports/weekly/`

（更新本文档时，把「最新进展」小节同步到最近一轮记录，链接指向上述文件，不重复粘贴内容。）

## 快速开始

（复制模板后按需填写）

1. 立项评估：填 `project_docs/design_specs/PROJECT_PROPOSAL_TEMPLATE.md`（问题定义 + 创新性评估 + **自杀式测试** + 风险评估），通过后再立项。
2. 登记项目：读 `project_docs/agent_handoff/START_HERE.md`，建立首个基线到 `project_docs/baselines/`。
3. 建立环境：填 `docs/environment.md`（工具链版本、依赖、复现步骤），按 `code/scripts/` 验证。
4. 开发：在 `code/src/` 下按模块建目录，遵守 `code/src/DESIGN.md`。
5. 实验：在 `experiments/` 定义（含反驳性测试），结果证据归 `project_docs/evidence/`。
6. 论文：默认写中文 `paper/zh/manuscript/`；术语入 `paper/GLOSSARY.md`；仅投稿英文期刊时才转换英文版。
7. 阶段完成：打基线 + git tag，完整复制为 `versions/<基线ID>/` 冻结快照。

## 目录角色

### 仓库契约（顶层）

| 文件 / 目录 | 角色 |
|------|------|
| `README.md` | 本文档：总览 / 设计 / 进展 / 快速开始 / 目录角色 / 工作规则 |
| `AGENTS.md` | 智能体行为契约：质疑 / 质量 / 自我批判 / 记录 / 并行 |
| `CONTRIBUTING.md` | 协作规范：分支 / 提交 / PR / 多智能体分工 |
| `SECURITY.md` | 安全与密钥管理（什么不进仓库） |
| `CHANGELOG.md` | 变更日志（按版本记录重要变更） |
| `.codex-handoff.json` | 交接元数据（read_order 阅读顺序） |
| `.github/` | PR 模板 + CI 自动检查 |

### 当前版本（主目录 = 最新最好的版本）

| 目录 | 角色 |
|------|------|
| `code/` | 代码资产：`src/` 源码 + `scripts/` 脚本 + `tests/` 测试 |
| `project/` | 构建工程 / 运行脚本（生成工程 git-ignored） |
| `experiments/` | 实验定义与编排（含反驳性测试；结果证据归 `evidence/`） |
| `docs/` | 技术文档：环境（`environment.md`）、术语（`GLOSSARY.md`）、经验库（`EXPERIENCE.md`） |

### 项目级共享

| 目录 | 角色 |
|------|------|
| `data/` | 数据治理：`manifests/` `raw/` `derived/` `schemas/` |
| `paper/` | 论文：`zh/` 中文主版 + `en/` 英文转换版 + `GLOSSARY.md` 术语表 |
| `project_docs/` | 过程文档：交接 / 基线 / 证据 / 进度 / 日志 / 未决 / 周报 / 评审 |

### 版本与辅助

| 目录 | 角色 |
|------|------|
| `versions/` | 冻结版本集合；每版本为完整体（code/project/experiments/docs），零交叉引用 |
| `skills/` | 项目级技能（ARS 学术技能 + `user-paper-style`） |
| `scratch/` | 临时脚本 / 探针（git-ignored） |

## 工作规则

1. **版本定义**：每个版本 = 论文 + 源码 + 测试 + 证据的四元绑定，冻结为 `versions/<基线ID>/` 完整快照；工作树名、运行目录名不定义版本，详见 `project_docs/versioning.md`。
2. **工作树**：一次性执行环境，物理位置在同步仓库之外，注册于 `project_docs/worktrees/WORKTREE_REGISTRY.csv`。
3. **结论口径**：每条结论区分「软件本地复现 / 策略复现 / 硬件复现 / 实测数据」，避免过度声称。
4. **证据自包含**：每个证据包含 README + 摘要 + 输入/来源 + 原始输出 + SHA-256 清单，见 `project_docs/evidence/README.md`。
5. **产物隔离**：生成产物放 git-ignored 的 `project/`、`scratch/`，绝不放在源码或主稿件旁。
6. **中英双版本**：论文以 `zh/` 为主版本；只有进入英文期刊流程时才维护 `en/`，两版结论必须一致。
7. **交接即承诺**：本轮结束前更新 `WORK_PROGRESS.md`、`CURRENT_STATUS.md`、`TASK_BOARD.md` 与 `CURRENT_RUN_HANDOFF.md`，按下一次接手者角度写明「下一步做什么、证据门是什么、不要做什么」。
8. **质疑优先**：任何结论、方案与数字在采信前先质疑与验证；证据高于权威，不因来源（用户、上级、主流、既有代码）而盲目认可与服从。
9. **质量标准**：设计先评审后实施；实施不轻易降级，论文以提升代替降低说法；需要时敢于大改，力争力所能及做到最好。
10. **Git 纪律**：阶段性工作完成即 `git commit` + `git push`，里程碑打 tag；工程代码推进前先固化当前状态（备份）；可为新版本复制目录（含脚本），但复制后自包含、不引用旧版本文件。
11. **文档同步**：任何目录 / 结构 / 路径变更后，必须同步更新主目录文档（`README.md` 目录角色与工作规则、`AGENTS.md`、`.codex-handoff.json`），文档与真实结构保持一致。
12. **经验沉淀**：解决问题后当天登记到 `docs/EXPERIENCE.md`（现象 / 原因 / 解决 / 验证），避免反复踩坑。
13. **并行协作**：可分解的独立子任务默认多智能体并发，不串行；识别依赖（独立并行、有依赖串行）；并行结果汇合后统一过审查门，关键路径留在主线。
14. **破坏性操作防护**：删除 / 覆盖 / 重构前确保可回退——先 `git status` 确认已提交，未跟踪文件先备份；删除用 `git rm`，不裸 `rm`。
