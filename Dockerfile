## Build
FROM golang:1.16-buster AS build

WORKDIR /app

COPY go.mod ./
RUN go mod download

RUN mkdir -p cmd
RUN mkdir -p bin
COPY cmd/main.go cmd

RUN CGO_ENABLED=0 go build -o bin/server cmd/main.go

## Deploy
FROM alpine:latest AS server

WORKDIR /

COPY --from=build /app/bin/server /root/server

EXPOSE 8082

RUN chmod +x /root/server

ENTRYPOINT ["/root/server"]