FROM python:3

RUN apt update && apt install -y vim git tar unzip pwgen libnss3

RUN wget "https://chromedriver.storage.googleapis.com/77.0.3865.40/chromedriver_linux64.zip" -O /usr/local/bin/chromedriver_linux64.zip && \
    cd /usr/local/bin/ && unzip chromedriver_linux64.zip

RUN wget "https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-linux64.tar.gz" -O /usr/local/bin/geckodriver-v0.24.0-linux64.tar.gz && \
    cd /usr/local/bin/ && tar zxvf geckodriver-v0.24.0-linux64.tar.gz

WORKDIR /tests
