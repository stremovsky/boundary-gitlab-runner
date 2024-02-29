# Dockerized GitLab Runner with Hashicorp Boundary

This project provides a Docker image that combines Hashicorp Boundary and GitLab Runner, enabling secure access to servers within your GitLab pipelines through Boundary.

### Benefits:

- **Centralized Access Control:** Boundary acts as a central hub for managing access to servers, simplifying credential management and improving security.
- **Streamlined Workflows:** GitLab pipelines can leverage Boundary to securely connect to servers, eliminating the need for manual credential management within scripts or runners.

## Getting Started:

### 1. Prerequisites:

- **Docker:** Ensure Docker is installed and running on your system. You can find installation instructions at https://docs.docker.com/engine/install/.
- **Hashicorp Boundary:** Set up a Boundary server and create the necessary roles and credentials for your use case. Refer to the Boundary documentation for detailed instructions: https://developer.hashicorp.com/boundary/docs.
- **GitLab Runner:** Configure your GitLab Runner with the appropriate settings for your project. Consult the GitLab Runner documentation for guidance: https://docs.gitlab.com/runner/.

### 3.Environment Variables:

- **BOUNDARY_ADDR:** (Required) The URL of your Boundary service (e.g., https://your-boundary-server.example.com).
- **BOUNDARY_USER:** (Required) The username for authenticating with Boundary.
- **BOUNDARY_PASSWORD:** (Required) The password associated with the BOUNDARY_USER account.
- **GITLAB_RUNNER_TOKEN:** (Optional) The GitLab Runner registration token for connecting to your GitLab instance.

### 3.Running the Container:

```
docker run -d \
  -e BOUNDARY_ADDR=https://your-boundary-server.example.com \
  -e BOUNDARY_USER=your_username \
  -e BOUNDARY_PASSWORD=your_password \
  [other_gitlab_runner_env_vars] \
  <your_image_name>
```
