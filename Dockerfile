FROM python:3.8.0-slim

WORKDIR /app
COPY /analytics/ /app

RUN apt update
RUN apt install build-essential libpq-dev postgresql postgresql-contrib -y
RUN pip install --upgrade pip setuptools wheel
RUN pip install -r requirements.txt

CMD ["python", "app.py"]