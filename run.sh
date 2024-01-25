#!/bin/bash

docker kill runner || true
docker rm runner
USERDIR=`getent passwd $USER | cut -d: -f6`
docker run --name runner -d --restart unless-stopped -v $USERDIR/.gitlab-runner:/etc/gitlab-runner -p 127.0.0.1:9200:9200 --env-file .env runner
