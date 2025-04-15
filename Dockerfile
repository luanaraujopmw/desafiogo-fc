FROM golang:alpine3.5 AS builder
WORKDIR /app
COPY main.go .
RUN go build -o /fc main.go

FROM scratch
WORKDIR /
COPY --from=builder /fc .
ENTRYPOINT ["/fc"]