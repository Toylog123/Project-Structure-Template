---
name: paper-writing-workflow
description: 学术论文写作工作流——编辑 LaTeX 稿件、审稿回复、编译校验、PDF 检查。编辑论文或回复审稿意见时使用。
---

# Paper Writing Workflow

## 活跃文件

- 中文源文件：`paper/zh/manuscript/[主稿件].tex`
- 中文 PDF：`paper/zh/build/[主稿件].pdf`
- 正式回复：`paper/zh/responses/response_to_reviewers_formal_zh.md`
- 内部回复：`paper/zh/responses/response_to_reviewers_zh.md`
- 终稿图：`paper/zh/figures/final/`
- 英文源文件（按需）：`paper/en/manuscript/[主稿件]_en.tex`
- 论文-证据交叉表：`project_docs/evidence/CROSSWALK_TEMPLATE.md`

中文稿件为单一权威 `.tex` 文件，不拆分为多文件。

## 前置阅读

1. `project_docs/agent_handoff/START_HERE.md`
2. `project_docs/agent_handoff/TASK_BOARD.md`
3. `project_docs/baselines/` 活跃基线
4. 所改声明对应的证据包
5. 中文稿件及两份回复

## 核心规则

1. **证据先行**：每个关键数字必须能追溯到结果、日志、报告或不可变摘要。
2. **口径区分**：软件复现 / 策略复现 / RTL 回放 / 工具报告 / 实测，不同口径不得互换。
3. **中文优先**：中文包稳定后再同步英文。
4. **论文语言**：写成成熟论文，不写版本迭代、开发过程或防御性说明。
5. 改稿件声明或局限性时，同步更新正式回复与内部回复。
6. 改数字/表/证据来源时，同步更新证据交叉表。
7. **术语统一**：以 `paper/GLOSSARY.md` 为准；新增术语先登记再行文。

## 工作流

### 1. 审计证据

- 确定受影响的声明/表/图。
- 打开展示基线及支撑证据包。
- 检查输入、版本、类型、单位、样本量、声明边界。
- 证据不足时，先设计并完成缺失实验，再强化论述。

### 2. 编辑中文源文件与回复

- 直接编辑 `paper/zh/manuscript/[主稿件].tex`。
- 终稿图放 `paper/zh/figures/final/`；未采用备选留在 `candidates/`。
- 同步编辑 `paper/zh/responses/` 下两份回复文件。

### 3. 编译

从仓库根目录执行：

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File paper/zh/scripts/compile.ps1
```

检查 `paper/zh/build/[主稿件].log`：LaTeX fatal error、undefined reference/citation、missing character、rerun-needed warning、`Overfull \hbox` 均视为未解决。

### 4. 渲染检查

逐页渲染 PDF，验证：

- 无栏目重叠、裁切或页边溢出；
- 无表格/图超出；
- 无公式/路径/等宽文本断裂；
- 图标签在最终栏宽下可读；
- 图/表标题引用稳定。

### 5. 写回状态

更新 `project_docs/agent_handoff/TASK_BOARD.md`、`status_logs/CURRENT_STATUS.md`、`CURRENT_RUN_HANDOFF.md`、`project_docs/WORK_PROGRESS.md`。

## 不要做的事

- 不要先编辑英文版。
- 不要改 `.tex` 后不编译且不检查渲染 PDF。
- 不要用归档论文、拆分章节、Word 文件或工作树名作为事实来源。
- 不要把估计值或有限窗口观察写成实测或无限制声明。
