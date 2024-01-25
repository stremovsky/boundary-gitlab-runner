#!/bin/bash

docker kill runner || true
docker rm runner
USERDIR=`getent passwd $USER | cut -d: -f6`
docker run --name runner -ti --rm -v $USERDIR/.gitlab-runner:/etc/gitlab-runner --env-file .env --entrypoint /bin/bash runner
