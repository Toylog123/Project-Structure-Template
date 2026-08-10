# 论文字体（随项目分发，避免换电脑重装）

按《计算机辅助设计与图形学学报》投稿要求，本目录集中放置论文所需字体：

| 字体 | 文件 | 状态 |
|------|------|------|
| 方正书宋_GBK（中文正文） | `FangZhengShuSong-GBK/FangZhengShuSong-GBK-1.ttf` | ✅ 已含 |
| 黑体（标题/摘要/关键词标签） | `simhei.ttf`（拷贝自系统） | ✅ 已含 |
| 方正仿宋_GBK（作者名） | `FangZhengFangSong-GBK/…` | ⚠️ 待解压 rar |
| 仿宋（回退，临时） | `simfang.ttf`（拷贝自系统） | ✅ 已含 |
| Times New Roman（英文/公式） | `times.ttf`（拷贝自系统） | ✅ 已含 |

## 待办：方正仿宋_GBK

`D:\BaiduSyncdisk\99_归档\4方正仿宋GBK（正文三号）.rar` 需解压后放入
`paper/zh/fonts/FangZhengFangSong-GBK/`（用 WinRAR / 360 / 7-Zip 解压），
然后启用 `template.tex` 中的对应 `\newCJKfontfamily` 行（取消注释、切换字体名）。

## 用法

LaTeX 通过相对路径 `../../fonts/` 加载字体（见 `template.tex` / `example_paper.tex`），
不依赖系统安装，换电脑即可编译。
