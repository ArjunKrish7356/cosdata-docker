---
## Dockerizing Cosdata: A Quick Start Guide

This `Dockerfile` provides a straightforward way to containerize the **Cosdata** database server. By using this image, you can quickly set up and run a Cosdata instance within a Docker environment, making it easier to deploy and manage.

---
### Key Features

* **Lightweight Base Image**: Built on `alpine:latest` for a small and efficient image size.
* **Automated Installation**: Installs `curl` and `bash` and then uses the official Cosdata installation script.
* **Port Exposure**: Exposes the necessary ports for Cosdata:
    * **`8443`**: For the Cosdata server.
    * **`50051`**: For gRPC communication.
* **Configurable Host**: Automatically modifies the Cosdata configuration to bind to `0.0.0.0`, allowing access from outside the Docker container.
* **Environment Variable**: Sets `COSDATA_HOME` to `/root/cosdata-v0.1.0-alpha` for easy reference to the installation directory.
* **Direct Startup**: The container directly executes the `start-cosdata` command upon launch.

---
### How to Use

#### 1. Build the Docker Image

Navigate to the directory containing this `Dockerfile` and run the following command to build your Docker image:

```bash
docker build -t cosdata-server .
```

#### 2. Run the Docker Container

Once the image is built, you can run a Cosdata container using:

```bash
docker run -d -p 8443:8443 -p 50051:50051 --name cosdata-instance cosdata-server
```

* `-d`: Runs the container in detached mode (in the background).
* `-p 8443:8443`: Maps port 8443 on your host to port 8443 in the container.
* `-p 50051:50051`: Maps port 50051 on your host to port 50051 in the container.
* `--name cosdata-instance`: Assigns a readable name to your container.
* `cosdata-server`: The name of the Docker image you just built.

#### 3. Verify Cosdata is Running

You can check if the container is running and healthy by using:

```bash
docker ps
```

You should see `cosdata-instance` listed. You can also view the logs for the container to ensure Cosdata started correctly:

```bash
docker logs cosdata-instance
```

---
### Accessing Cosdata

With the container running, Cosdata should be accessible on your host machine via the exposed ports. You can now connect to your Cosdata instance using the appropriate client tools or applications.

---
### Customization

If you need to customize the Cosdata installation or configuration further, you can modify the `Dockerfile` before building the image. For example, you might:

* Change the Cosdata version by updating the `curl` URL.
* Add more configuration changes to `config.toml`.
* Include additional dependencies if your Cosdata usage requires them.

---
