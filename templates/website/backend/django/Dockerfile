FROM python:3.14.3-slim-bookworm
ENV PYTHONDONTWRITEBYTECODE=1 \
PYTHONUNBUFFERED=1
RUN apt update && apt upgrade -y && apt install -y curl
WORKDIR /app
CMD ["cd /app && \
if [ ! -f manage.py ]; then \
    python3 manage.py runserver 0.0.0.0:8000 && \
    exec bash
else
    python3 -m venv /app/.venv && \
    source /app/.venv/bin/activate && \
    pip install --no-cache-dir -r requirements.txt && \
    django-admin startproject $PROJECT_ID . && \
    python3 manage.py runserver 0.0.0.0:8000 && \
    exec bash
fi"]