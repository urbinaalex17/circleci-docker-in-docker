# syntax = docker/dockerfile:1.0-experimental
FROM python:3.7-slim as build
WORKDIR /app
ADD requirements.txt .
RUN python3 -m pip install -r requirements.txt
ADD src/ .
RUN --mount=type=secret,id=env,dst=/app/.env cat /app/.env > /tmp/env

FROM build as production
ENV FLASK_APP=server.py
EXPOSE 5000
CMD flask run --host=0.0.0.0
