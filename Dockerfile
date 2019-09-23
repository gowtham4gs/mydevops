FROM python:3.7
MAINTAINER your_name
ADD . /usr/src/app
WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:8000 || exit 1
EXPOSE 8000
CMD exec gunicorn mydev.wsgi:application --bind 0.0.0.0:8000 --workers 3