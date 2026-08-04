# 实验

本目录是实验定义、负载配置与编排代码的长期归属地。**结果证据不放在这里**，归 `project_docs/evidence/`。

每项实验应说明：

- 基线版本（绑定哪份代码 / 基线）
- 输入清单（数据来源、manifest）
- 命令（如何运行）
- 期望输出
- 证据去向（`project_docs/evidence/` 中的目标路径）

建议结构（按需创建，避免冗余）：

```text
experiments/
|- case_a/            # 实验 A
|- case_b/            # 实验 B
`- common/            # 公共工具 / 配置
```
