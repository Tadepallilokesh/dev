FROM python:3.8-slim
WORKDIR /app
COPY . /app
RUN pip install Flask:2.1.3
RUN pip install werkzeug:2.0.2
EXPOSE 5000
CMD ["python","app.py"]
