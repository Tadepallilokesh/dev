FROM python 
WORKDIR /app
COPY . /app
RUN pip install --no-cache-dir Flask:2.1.3
RUN pip install --no-cache-dir werkzeug:2.0.2
EXPOSE 5000
CMD ["python","app.py"]
