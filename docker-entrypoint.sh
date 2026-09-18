#!/bin/bash
set -e

echo "🔄 执行数据库迁移..."
python manage.py migrate --noinput

echo "📦 收集静态文件..."
##python manage.py collectstatic --noinput

echo "🚀 启动应用..."

# 执行传入的命令（CMD的内容）
exec "$@"

