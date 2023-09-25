## Bash Script

The `compose_students_repos.sh` script in this project performs the following tasks:

- **Dynamic Docker Compose Configuration:** It dynamically generates a `docker-compose.generated.yml` file based on the contents of the `repos` directory. For each subdirectory (representing a repository), it creates a separate service definition with appropriate settings.

- **Serving HTML Files:** The generated Docker Compose file sets up Nginx containers to serve the `index.html` files from each repository. Each service is accessible on a different port, allowing you to access different repositories via separate local URLs.

- **Usage:** To use the script, follow these steps:
  1. Ensure your repository structure follows the specified format.
  2. Run the script using `./generate-docker-compose.sh` to generate the `docker-compose.generated.yml` file.
  3. Use the generated file with Docker Compose to create and start the containers.

```bash
./generate-docker-compose.sh
docker-compose -f docker-compose.generated.yml up -d
