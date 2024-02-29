# Dockefile for GitLab Runner + Hashicorp Boundary

This project creates a new docker container that consists of Hashicorp Boundary and GitLab Runner.

After creating instance of container, it signs into the Boundary service and your pipeline can connect to servers via Boundary.

The Dockerfile usses the following entrypoint:

```
ENTRYPOINT ["/bin/sh", "-c" , "./boundary-login.sh ; gitlab-runner run"]
```

## Environment variables
* ```BOUNDARY_ADDR``` - url of the boundary service
* ```BOUNDARY_USER``` - boundary username
* ```BOUNDARY_PASSWORD``` - user password to use
