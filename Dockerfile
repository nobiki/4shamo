FROM python:3

RUN apt-get update && apt-get install -y vim git unzip pwgen libnss3 libgconf2-4
RUN pip install selenium==3.13.0 robotframework==3.0.4 robotframework-seleniumlibrary==3.1.1

RUN wget "https://chromedriver.storage.googleapis.com/2.40/chromedriver_linux64.zip" -O /usr/local/bin/chromedriver_linux64.zip && \
    cd /usr/local/bin/ && unzip chromedriver_linux64.zip

# RUN mkdir -p /tests/results
# COPY ./tests /tests
WORKDIR /tests
