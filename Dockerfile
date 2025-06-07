FROM python:latest
MAINTAINER Mradul Natani "mradulnatani0@gmail.com"
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/mradulnatani/upload-to-consul-kv.git /app
WORKDIR /app
RUN pip install --no-cache-dir -r requirements.txt
CMD ["python", "uploadtoconsulkv.py"]

