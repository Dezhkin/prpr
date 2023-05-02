# этап 1: компиляция приложения
FROM golang:1.20.3-alpine AS build

# установка зависимостей
WORKDIR /app
COPY . .
RUN GO111MODULE=off go build -o app .


# этап 2: создание минимального образа
FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=build /app/app ./
CMD ["./app"]