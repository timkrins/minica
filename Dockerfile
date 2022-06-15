FROM golang:1.18.3-alpine3.16 as build
WORKDIR /minica
COPY main.go go.mod .
RUN apk add --no-cache git \
  && go install github.com/jsha/minica

FROM alpine:3.16
COPY --from=build /go/bin/minica /usr/local/bin/minica
RUN mkdir /output
WORKDIR /output
ENTRYPOINT ["minica"]
