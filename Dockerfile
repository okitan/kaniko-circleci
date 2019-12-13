FROM gcr.io/kaniko-project/executor:latest AS kaniko

FROM alpine:latest

COPY --from=kaniko /kaniko /kaniko

# also do like https://github.com/GoogleContainerTools/kaniko/blob/master/deploy/Dockerfile
ENV PATH $PATH:/kaniko
ENV SSL_CERT_DIR=/kaniko/ssl/certs
ENV DOCKER_CONFIG /kaniko/.docker/
ENV DOCKER_CREDENTIAL_GCR_CONFIG /kaniko/.config/gcloud/docker_credential_gcr_config.json
WORKDIR /workspace

ENTRYPOINT ["/kaniko/executor"]
