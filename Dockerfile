FROM golang:1.18.3-alpine3.16 as build
COPY main.go .
RUN apk add --no-cache git \
  && go build

FROM alpine:3.16
COPY --from=build /go/bin/minica /usr/local/bin/minica
RUN mkdir /output
WORKDIR /output
ENTRYPOINT ["minica"]
