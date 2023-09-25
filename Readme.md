
# Docker Compose for Hosting Git Repositories with Nginx

This Docker Compose configuration allows you to create a local environment for hosting multiple Git repositories using Nginx. Each repository is served on a separate port within a specified range, making it easy to access and view their `index.html` files.

## Features

- **Custom Nginx Configuration**: The setup uses a custom Nginx configuration to serve the Git repositories and their `index.html` files.

- **Range of Ports**: Git repositories are accessible on ports ranging from 4200 to 4280. You can adjust this range as needed in the `docker-compose.yml` file.

- **Simple Management**: Docker Compose simplifies the management of multiple containers, making it easy to start and stop the environment.

## Prerequisites

Before using this setup, make sure you have the following installed on your system:

- Docker: [Install Docker](https://docs.docker.com/get-docker/)
- Docker Compose: [Install Docker Compose](https://docs.docker.com/compose/install/)

## Usage

1. **Clone this Repository**: Clone this repository to your local machine.

2. **Place Repositories**: Place your Git repositories inside the `repos` directory. Each repository should have an `index.html` file that you want to serve.

3. **Build the Custom Nginx Image**:

   ```bash
   docker build -t custom-nginx .
   ```

4. **Start the Containers**:

   ```bash
   docker-compose up -d
   ```

   This command will start two containers: one for Nginx and one for managing the Git repositories.

5. **Access Your Repositories**:

   - Access the repositories via your web browser using the following format:
     - `http://localhost:4200/repos/repo1/` for the first repository.
     - `http://localhost:4201/repos/repo2/` for the second repository.
     - ...and so on, up to port 4280 for the 80th repository.

6. **Stopping the Containers**:

   To stop the containers, use the following command:

   ```bash
   docker-compose down
   ```

## Customization

- **Changing Port Range**: You can adjust the range of ports in the `docker-compose.yml` file to fit your needs.

- **Updating Nginx Configuration**: If you need to customize the Nginx configuration, modify the `nginx.conf` file in the same directory as the `Dockerfile`.

- **Updating Repository Management**: The `git-repos` service in the `docker-compose.yml` file can be customized for more advanced repository management if needed. 
(ex. Setting up repo to specific commit by checkout)
