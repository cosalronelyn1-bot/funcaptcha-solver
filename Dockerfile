FROM python:3.12-slim

RUN apt-get update && apt-get install -y curl ca-certificates && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

RUN pip install --no-cache-dir -r requirements.txt
RUN npm install jsdom

ENV PORT=10000
EXPOSE 10000

CMD ["python", "render_entrypoint.py"]
