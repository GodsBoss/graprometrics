FROM golang:1.10.3-alpine3.7 AS compiler
WORKDIR /go/src/github.com/GodsBoss/graprometrics/metricsgen/
ENV CGO_ENABLED=0
RUN apk add --update-cache \
  git
RUN go get -u -v golang.org/x/vgo
COPY * /go/src/github.com/GodsBoss/graprometrics/metricsgen/
RUN vgo build

FROM alpine:3.7
EXPOSE 80
COPY --from=compiler /go/src/github.com/GodsBoss/graprometrics/metricsgen/metricsgen /root
CMD ["/root/metricsgen"]
