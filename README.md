# docker-feishin

[![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/j33r/feishin?style=flat-square)](https://microbadger.com/images/j33r/feishin)
![GitHub Workflow Status (branch)](https://img.shields.io/github/actions/workflow/status/jee-r/docker-feishin/deploy.yaml?branch=main&style=flat-square)
[![Docker Pulls](https://img.shields.io/docker/pulls/j33r/feishin?style=flat-square)](https://hub.docker.com/r/j33r/feishin)
[![DockerHub](https://img.shields.io/badge/Dockerhub-j33r/feishin-%232496ED?logo=docker&style=flat-square)](https://hub.docker.com/r/j33r/feishin)
[![ghcr.io](https://img.shields.io/badge/ghrc%2Eio-jee%2D-r/feishin-%232496ED?logo=github&style=flat-square)](https://ghcr.io/jee-r/feishin)


A docker image for [feishin](https://github.com/jeffvli/feishin).

## What is Feishin?

From [feishin](https://github.com/jeffvli/feishin):

> A modern self-hosted music player. 

## How to use these images

### Docker run

```bash
docker run \
    --detach \
    --interactive \
    --name feishin \
    --user $(id -u):$(id -g)
    --env TZ=Europe/Paris
    --volume /etc/localtime:/etc/localtime:ro
    ghcr.io/jee-r/feishin:latest
```    

### Docker Compose

[`docker-compose`](https://docs.docker.com/compose/) can help with defining the `docker run` config in a repeatable way rather than ensuring you always pass the same CLI arguments.

Here's an example `docker-compose.yml` config:

```yaml
version: "3"

services:
  feishin:
    image: ghcr.io/jee-r/feishin:latest    
    user: "${UID:-1000}:${GID:-1000}"
    restart: unless-stopped
    environment:
        - HOME=/app
        - TZ=Europe/Paris
    volumes:
        - /etc/localtime:/etc/localtime:ro
```

### Volume mounts
Due to the ephemeral nature of Docker containers these images provide a number of optional volume mounts to persist data outside of the container:

- `/config` contain : config files if needed

You should create directory before run the container otherwise directories are created by the docker deamon and owned by the root user

### Environment variables

To change the timezone of the container set the `TZ` environment variable. The full list of available options can be found on [Wikipedia](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones).

You can also set the `HOME` environment variable this is usefull to get in the right directory when you attach a shell in your docker container.

## License

This project is under the [GNU Generic Public License v3](https://gitjee-rSERNAME>/docker-feishin/blob/master/LICENSE) to allow free use while ensuring it stays open.

## Credits

<CREDIT>
