# figures — 论文图

| 子目录 | 放什么 |
|--------|--------|
| `final/` | 定稿图（PNG，被 .tex 引用） |
| `sources/` | 源文件（draw.io 等） |
| `candidates/` | 候选图（未定稿） |
| `drawing_prompts/` | 手工绘图提示词 |
| `plot_specs/` | 定量折线图绘制说明 |
| `scripts/` | 绘图脚本 |

命名：`fig<N>_<描述>.png`，与 .tex 中 `\ref` 对应。

## 绘图分工

| 图类型 | 由谁画 | 方式 |
|--------|--------|------|
| 数据图（定量折线图、统计图、曲线） | AI 用 `nature-figure` 技能 | 脚本生成，数据来自证据包，可复现 |
| 机制图（系统结构图、流程图、硬件结构图） | **详细设计提示词（结构示意）→ 草图 → 用户手工画最终版** | AI 给出含结构示意的提示词 + 草图（`candidates/`），用户按提示词绘制 |

- 数据图：`scripts/` 下脚本生成，数据源来自 `project_docs/evidence/`。
- 机制图：AI 先写**详细设计提示词**（见 `drawing_prompts/MECHANISM_FIGURE_PROMPT_TEMPLATE.md`，含模块 / 连线 / 数据流 / 层次结构示意），并出草图（`candidates/`）；论文中放草图占位，**最终由用户按提示词手工绘制**，源文件存 `sources/`、定稿存 `final/`。
