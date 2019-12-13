FROM gcr.io/kaniko-project/executor:latest AS kaniko

FROM alpine:latest

RUN  apk update \
  && apk add ca-certificates \
  && update-ca-certificates

COPY --from=kaniko /kaniko /kaniko

ENTRYPOINT ["/kaniko/executor"]
