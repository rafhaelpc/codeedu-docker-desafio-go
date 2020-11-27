FROM golang:1.15 as builder

WORKDIR /go/src/desafio
COPY . .
RUN GOOS=linux go build -ldflags="-s -w"

FROM scratch
WORKDIR /go/src
COPY --from=builder  /go/src/desafio .
ENTRYPOINT [ "./desafio" ]

