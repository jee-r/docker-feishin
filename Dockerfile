FROM node:18-alpine3.18 as builder

WORKDIR /app

RUN apk add \
        git && \
    git clone https://github.com/jeffvli/feishin.git /app && \
    npm install && \
    npm run build:web

FROM nginxinc/nginx-unprivileged:alpine3.18

LABEL name="feishin" \
      maintainer="Jee jee@jeer.fr" \
      description="A modern self-hosted music player." \
      url="https://github.com/jeffvli/feishin" \
      org.label-schema.vcs-url="https://github.com/jee-r/docker-feishin" \
      org.opencontainers.image.source="https://github.com/jee-r/docker-feishin"
      
COPY --from=builder /app/release/app/dist/web /usr/share/nginx/htm