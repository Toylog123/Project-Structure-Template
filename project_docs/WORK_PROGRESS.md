# Work Progress

本文件按**倒序**记录每一轮工作（最新在上）。每轮条目包含：日期、标题、做了什么、关键结果、证据/提交、下一步。

> 日期格式 `YYYY-MM-DD`。

## 2026-08-06 新增论文中英专业术语对照表

- 做了什么：在 `paper/GLOSSARY.md` 新建论文专业术语表（中英对照 + 名词解释 + 翻译规则），要求论文所有术语 / 专业名词详细登记；同步更新 `paper/README.md`、`paper/en/README.md` 引用术语表；将协作契约核心原则强化为「先质疑，不盲目认可与服从」（`AGENTS.md` 核心原则 + `README.md` 工作规则第 8 条）。
- 关键结果：推送 `3523fd4`；修复 git SSL 推送问题（全局设置 `http.sslBackend=schannel`）。
- 证据 / 提交：`3523fd4`
- 下一步：实际项目写论文前，先在此表登记全部术语再行文。

## 2026-08-04 建立通用工程模板（Project-Structure-Template）

- 做了什么：从零搭建通用工程项目模板：src / paper / experiments / data / project_docs / scripts / tests / skills 目录；交接体系（agent_handoff）、进度记录（WORK_PROGRESS / CURRENT_STATUS）、周报模板、版本管理（versioning.md）、中英双版本论文框架（paper/zh + paper/en）。
- 关键结果：模板已推送 GitHub（Toylog123/Project-Structure-Template）；补全全部空目录 `.gitkeep` 与示例文件；新增项目立项评估模板与四份工程/科研文档（环境、术语、评审、交叉表）；落地框架工具（健康检查 `check_project.sh`、基线 manifest `make_manifest.sh`、Makefile、CI）；为全部内容目录补"放什么 + 形式"说明与示例；新增论文中英专业术语对照表 `paper/GLOSSARY.md`。
- 证据 / 提交：`124a682`、`de54e4d`、`6819071`
- 下一步：实际项目复制模板后替换 `[占位]` 内容。

---

## 模板使用说明

复制模板后，把占位条目替换为首条真实记录。之后每一轮在**顶部**插入新条目（最新在上）。同步更新：

- `agent_handoff/status_logs/CURRENT_STATUS.md`（本轮状态）
- `agent_handoff/TASK_BOARD.md`（任务证据门）
- `agent_handoff/CURRENT_RUN_HANDOFF.md`（本轮交接）
- `reports/weekly/`（周/周期总结）
