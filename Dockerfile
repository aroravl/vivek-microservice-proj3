FROM python:3.8.0-slim


WORKDIR /app
COPY requirements.txt .
 
# RUN apk update && apk upgrade expat xz  --no-cache
# RUN apk add build-essential libpq-dev postgresql postgresql-contrib 
# RUN pip install --upgrade pip setuptools wheel
RUN apt update
RUN apt install build-essential libpq-dev postgresql postgresql-contrib -y
RUN pip install --upgrade pip setuptools wheel
RUN pip install -r requirements.txt
COPY app.py .
ENV DB_USERNAME=myuser
ENV DB_PASSWORD=mypassword
ENV DB_PORT=5433 
ENV DB_NAME=mydatabase
ENV POSTGRES_PASSWORD=mypassword
COPY  . /app
 
CMD ["python", "app.py"]



