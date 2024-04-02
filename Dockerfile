FROM ubuntu:latest
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
WORKDIR /usr/src/app
COPY . .
COPY ./path/to/your/app /var/www/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

