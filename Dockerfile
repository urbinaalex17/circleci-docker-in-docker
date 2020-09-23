FROM python:3.7-slim as build
WORKDIR /app
ADD requirements.txt .
RUN python3 -m pip install -r requirements.txt
ADD src/ .


FROM build as production
ENV FLASK_APP=server.py
EXPOSE 5000
CMD flask run --host=0.0.0.0
