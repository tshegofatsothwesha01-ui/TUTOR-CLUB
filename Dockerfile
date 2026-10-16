FROM python:3.11-slim

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Install CA certs for outbound HTTPS (PayFast, etc.)
RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY . .

# Optional compile check (non-fatal)
RUN python -m py_compile app.py || true

EXPOSE 8000

# Make the data directory a mount point for persistent storage
VOLUME ["/var/data"]

CMD ["python", "app.py", "--host", "0.0.0.0", "--port", "8000"]
