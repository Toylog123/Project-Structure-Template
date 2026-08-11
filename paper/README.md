# 论文（Paper）

本目录保存论文及必要的研究成果材料，采用 `zh` / `en` 双版本同构框架（目录结构对齐，便于中英互转）。

## 中英双版本约定

- `zh/`：**默认主版本**（中文），日常在此编辑与编译。
- `en/`：英文版本，**仅在投稿英文期刊 / 会议时才从中文转换并维护**。

两版结论必须一致；修改任何已报告数字时，同步两版并更新证据交叉引用（`project_docs/evidence/`）。

## 目录结构

```text
paper/
|- GLOSSARY.md           # 中英专业术语对照表（翻译统一）
|- zh/
|  |- manuscript/        # 中文主稿件（.tex，单文件）
|  |- responses/         # 当前轮审稿回复
|  |- review_rounds/     # 审稿轮次归档（意见+回复+修改前论文，每轮独立文件夹）
|  |- figures/
|  |  |- final/          # 定稿图（PNG）
|  |  |- sources/        # 源文件（draw.io 等）
|  |  |- candidates/     # 候选图
|  |  |- drawing_prompts/# 手工绘图提示词
|  |  |- plot_specs/     # 定量折线图绘制说明
|  |  `- scripts/        # 绘图脚本
|  |- scripts/
|  |  |- compile.bat     # 编译入口
|  |  |- compile.ps1     # 编译脚本
|  |  `- checks/         # 一致性检查脚本
|  `- build/             # 构建产物（git-ignored）
`- en/                   # 同上，英文版
```

## 规则

1. 修改已报告数字前，先在证据根定位来源，同一次编辑中更新稿件、回复与证据交叉表。
2. 生成物（build/、中间文件、PDF）一律 git-ignored，不提交。
3. 编译：`paper/zh/scripts/compile.bat`（输出到 `paper/zh/build/`）。
4. 定量折线图由 `figures/scripts/` 脚本生成以保证可复现；系统/结构图用 draw.io 存 `figures/sources/`，定稿导出 `figures/final/`。
5. **术语统一**：`GLOSSARY.md` 为中英专业术语对照表；论文用到的每个术语均登记其中，中英转换前先核对，两版译名必须一致。
