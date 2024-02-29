# Dockefile for GitLab Runner + Hashicorp Boundary

This project creates a new docker that consists of Hashicorp Boundary and GitLab Runner.

After creating instance of container, it signs into the boundary server and your pipeline can use boundary to connect to different servers.

It has the following entrypoint for that:

```
ENTRYPOINT ["/bin/sh", "-c" , "./boundary-login.sh ; ./setup.sh ; gitlab-runner run"]
```

## Environment variables
* ```BOUNDARY_ADDR``` - url of the boundary service
* ```BOUNDARY_USER``` - boundary username
* ```BOUNDARY_PASSWORD``` - user password to use
