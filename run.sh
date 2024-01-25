#!/bin/bash

docker run -d --name runner --restart unless-stopped -v .gitlab-runner/config:/etc/gitlab-runner runner
