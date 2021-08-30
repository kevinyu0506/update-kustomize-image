FROM alpine

RUN apk add --no-cache git

WORKDIR /app
COPY entrypoint.sh /app/

ENV REPO_ACCESS_TOKEN=
ENV REPO_URL=
ENV KUSTOMIZE_PATH=

ENV GITHUB_USER=
ENV GITHUB_USER_EMAIL=

ENV IMAGE=
ENV IMAGE_TAG=

CMD ["/bin/sh", "/app/entrypoint.sh"]
