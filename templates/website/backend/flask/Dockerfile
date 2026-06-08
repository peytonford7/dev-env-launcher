FROM python:3.14-alpine
WORKDIR /app
CMD ["sh", "-ec", "if [ -f requirements.txt ]; then pip install --no-cache-dir -r requirements.txt; fi; if [ -f main.py ]; then flask --app main run --host=0.0.0.0 --port=5000; fi; exec sh"]
