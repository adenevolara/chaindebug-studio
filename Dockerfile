# Build stage
FROM python:3.11-slim AS builder
WORKDIR /app
COPY pyproject.toml setup.py ./
RUN pip install --upgrade pip setuptools wheel \
    && pip wheel . --no-deps --wheel-dir /wheels

# Final stage
FROM python:3.11-slim
WORKDIR /app
# Create non-root user
RUN useradd --create-home appuser
USER appuser
COPY --from=builder /wheels /wheels
RUN pip install --no-index --find-links=/wheels chain-debug-lite
COPY . .
ENTRYPOINT ["chaindebug"]
