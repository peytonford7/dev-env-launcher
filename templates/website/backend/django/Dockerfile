FROM python:3.14-alpine
WORKDIR /app
CMD ["sh", "-ec", "if [ -f requirements.txt ]; then pip install --no-cache-dir -r requirements.txt; fi; if [ -f main.py ]; then python3 main.py; elif [ -f manage.py ]; then python3 manage.py runserver 0.0.0.0:8000; fi; exec sh"]
