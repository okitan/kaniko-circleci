FROM gcr.io/kaniko-project/executor:latest AS kaniko

FROM alpine:latest
COPY --from=kaniko /kaniko /kaniko

ENTRYPOINT ["/kaniko/executor"]
