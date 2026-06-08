FROM python:3.14-alpine
WORKDIR /app
CMD ["sh", "-ec", "if [ -f requirements.txt ]; then pip install --no-cache-dir -r requirements.txt; fi; if [ -f main.py ]; then uvicorn main:app --host 0.0.0.0 --port 8000; fi; exec sh"]
