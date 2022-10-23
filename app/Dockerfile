FROM golang:1.18

RUN mkdir /app
ADD . /app
WORKDIR /app

RUN go mod tidy

ENV DEVOPSTESTE_PORT=8006
ENV DEVOPSTESTE_NAME="Amo Promo"

EXPOSE 8006

RUN go build -o main .
CMD ["/app/main"]
