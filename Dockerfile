# Dockerfile.dev
FROM python:3.10.11

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1
#    DJANGO_SETTINGS_MODULE=dj_test_2026.settings.dev

# 安装系统依赖
#RUN apt-get update && apt-get install -y --no-install-recommends \
#    gcc \
#    libpq-dev \
#    libffi-dev \
#    curl \
#    vim \
#    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# 安装依赖
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple

# 复制代码
COPY . .
# 开发工具
# RUN pip install ipython django-extensions django-debug-toolbar watchdog

#
RUN python manage.py makemigrations --noinput
# 暴露端口
EXPOSE 8000
ENTRYPOINT ["/app/docker-entrypoint.sh"]
# CMD ["uwsgi", "--ini", "uwsgi.ini"]
# 开发服务器（支持热加载）
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
