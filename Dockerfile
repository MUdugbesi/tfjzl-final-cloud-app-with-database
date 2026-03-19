FROM python:3.12-slim
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /app
COPY requirements.txt /app/
RUN pip install -U -r requirements.txt
COPY . /app
EXPOSE $PORT
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
LABEL version="1.0" 
LABEL description="python3 django app docker image"
LABEL maintainer="MUdugbesi"
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 CMD curl -fs http://localhost:$PORT || exit 1 
USER daemon