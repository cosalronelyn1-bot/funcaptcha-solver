FROM python:3.10-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gcc \
    g++ \
    curl \
    ca-certificates \
    libssl-dev \
    libcurl4-openssl-dev \
    pkg-config \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

RUN python -m pip install --upgrade pip setuptools wheel
RUN pip install --no-cache-dir --prefer-binary \
    Flask==3.0.3 \
    cryptography==42.0.8 \
    pycryptodome==3.20.0 \
    curl_cffi==0.7.0 \
    colorama==0.4.6 \
    execjs==1.1.0 \
    colr==0.9.10 \
    numpy==1.26.4

RUN npm install jsdom

ENV PORT=10000
EXPOSE 10000

CMD ["python", "render_entrypoint.py"]
