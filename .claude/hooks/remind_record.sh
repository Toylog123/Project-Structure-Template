#!/usr/bin/env bash
# Claude Code 专属 Stop hook 薄封装：调用通用的记录检查脚本。
# 记录机制本身是通用的（scripts/check_record.sh），本 hook 仅为 Claude Code 用户自动触发。
exec bash "$(cd "$(dirname "$0")/../.." && pwd)/scripts/check_record.sh"
