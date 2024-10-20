FROM python:3.9-slim
WORKDIR /app
RUN apt-get update && apt-get install -y wget unzip && rm -rf /var/lib/apt/lists/*
COPY config.json .
COPY crawler.py .
RUN pip3 install -r requirements.txt
ENTRYPOINT ["python3", "crawler.py"]
