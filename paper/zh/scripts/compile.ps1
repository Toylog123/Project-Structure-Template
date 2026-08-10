# =============================================================================
# 中文论文编译脚本（LuaLaTeX）
# 用法：
#   powershell -NoProfile -ExecutionPolicy Bypass -File compile.ps1
#   powershell ... -File compile.ps1 -Name <论文名>      # 指定稿件名，默认 template
# 输出：paper/zh/build/<论文名>.pdf
# 字体：自动设置 OSFONTDIR 指向 paper/zh/fonts/（项目内字体，换电脑无需重装）
# =============================================================================
param([string]$Name = "template")

$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path   # paper/zh/scripts
$paperRoot = Join-Path $scriptDir ".."                          # paper/zh
$manuscript = Join-Path $paperRoot "manuscript"
$build = Join-Path $paperRoot "build"
$fontsDir = Join-Path $paperRoot "fonts"

New-Item -ItemType Directory -Force -Path $build | Out-Null
$src = Join-Path $manuscript "$Name.tex"
if (-not (Test-Path $src)) {
    Write-Error "未找到稿件: $src"
    exit 1
}

# 项目内字体搜索路径（LuaLaTeX + luaotfload 读取 OSFONTDIR）
$env:OSFONTDIR = $fontsDir

Push-Location $manuscript
try {
    # 两遍编译以解析交叉引用
    lualatex -interaction=nonstopmode -output-directory=$build "$Name.tex"
    lualatex -interaction=nonstopmode -output-directory=$build "$Name.tex"
    if ($LASTEXITCODE -ne 0) {
        Write-Error "编译失败，详见 $build\$Name.log"
        exit $LASTEXITCODE
    }
} finally {
    Pop-Location
}

Write-Host "编译完成: $build\$Name.pdf"
