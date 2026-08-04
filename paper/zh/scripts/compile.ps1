# =============================================================================
# 中文论文编译脚本
# 用法：
#   powershell -NoProfile -ExecutionPolicy Bypass -File compile.ps1
#   powershell ... -File compile.ps1 -Name <论文名>      # 指定稿件名，默认 template
# 输出：paper/zh/build/<论文名>.pdf
# 依赖：xelatex（TeX Live 或 MiKTeX）
# =============================================================================
param([string]$Name = "template")

$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path   # paper/zh/scripts
$paperRoot = Join-Path $scriptDir ".."                          # paper/zh
$manuscript = Join-Path $paperRoot "manuscript"
$build = Join-Path $paperRoot "build"

New-Item -ItemType Directory -Force -Path $build | Out-Null
$src = Join-Path $manuscript "$Name.tex"
if (-not (Test-Path $src)) {
    Write-Error "未找到稿件: $src"
    exit 1
}

Push-Location $manuscript
try {
    # 两遍编译以解析交叉引用
    xelatex -interaction=nonstopmode -output-directory=$build "$Name.tex"
    xelatex -interaction=nonstopmode -output-directory=$build "$Name.tex"
    if ($LASTEXITCODE -ne 0) {
        Write-Error "编译失败，详见 $build\$Name.log"
        exit $LASTEXITCODE
    }
} finally {
    Pop-Location
}

Write-Host "编译完成: $build\$Name.pdf"
