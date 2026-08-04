# 测试

按测试对象建立子目录。命名建议：`test_<对象>.py` / `<对象>_test.*`。

规则：

1. 测试结果报告与日志归 `project_docs/evidence/`，不留在本目录。
2. 测试数据小量可入 `tests/data/`；大量数据走 `data/raw/` 或 `data/derived/` 治理。
3. 关键回归结果应绑定具名基线（`project_docs/baselines/`）。
