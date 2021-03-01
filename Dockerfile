FROM golang:1.15.5

RUN go env -w GO111MODULE=on
RUn go env -w GOPROXY=https://goproxy.cn,direct
WORKDIR /go/src/github.com/paypal/load-watcher
COPY . .
RUN make build

FROM alpine:3.12

COPY --from=0 /go/src/github.com/paypal/load-watcher/bin/load-watcher /bin/load-watcher

CMD ["/bin/load-watcher"]
