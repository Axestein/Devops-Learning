# DockerLearning

Docker solves the problem of inconsistent environments by providing lightweight, portable containers that ensure applications run the same across different systems. It simplifies the deployment, scaling, and management of applications by isolating them in containers with all necessary dependencies.

**Benifits:**

=> Docker makes it easier to package applications and add to CI/CD pipelines.

=> Docker helps you package dependencies with containers.

=> Docker simplifies container technology to make creating and running containers easier.

### Container 
A container in Docker is a lightweight, portable, and isolated environment that packages an application along with its dependencies, ensuring it runs consistently across different systems.
(Containers are just a process (or a group of processes) running in isolation, which is achieved with Linux namespaces and control groups. Linux namespaces and control groups are features that are built into the Linux kernel. Other than the Linux kernel itself, there is nothing special about containers.

What makes containers useful is the tooling that surrounds them. The labs in this course use Docker, which has been the understood standard tool for using containers to build applications. Docker provides developers and operators with a friendly interface to build, ship, and run containers on any environment.)

![image](https://github.com/user-attachments/assets/88408f07-958d-4f88-93f0-e436055e491c)

### cmd
 docker -v          ->for version checking
 
 docker run -it demo        ->for running a container which  will have demo image  -it stands for interactive tty
 
 cntrl+D        ->to close the container
 
docker container ls          -> this will show all the working contaners of that docker image

linux commands work on docker (ls,cd,mkdir)

docker start       -> to start the already made container

docker stop       -> to stop the already made container

docker exec -it        -> to excute completely in an isolated container 

docker run -it <image_name>

docker exec <container_name> >command>

docker container run -t ubuntu top        -> docker container run command to run a container with the Ubuntu image by using the top command. The -t flag allocates a pseudo-TTY, which you need for the top command to work correctly

docker container run --detach --publish 8081:27017 --name mongo mongo:3.4

**TO REMOVE CONTAINER**

$ docker container ls

$ docker container stop [container id]

$ docker system prune

### Images
Images are OS on which containers run.
custom image can be made based on the resources and tools required.
(Docker images are lightweight, read-only templates used to create containers. They include the application code, runtime, libraries, and dependencies needed to run an application.)


![Screenshot 2025-01-10 154022](https://github.com/user-attachments/assets/4478c0aa-d22f-45b4-ab95-a9ef1dcdff98)
![Screenshot 2025-01-10 154124](https://github.com/user-attachments/assets/9031f89a-35bd-4201-b32d-78717aeed014)
![Screenshot 2025-01-10 154101](https://github.com/user-attachments/assets/16dd0ef5-7d8f-4c8f-9abf-daac3d06fa71)


(hub.docker.com) is where the docker gets its info if needed kinda like github for docker. If docker does not find any image or anything it will search from this hub only.

![image](https://github.com/user-attachments/assets/7910c58d-546f-487b-bd21-5f09ea283e89)

### Port Mapping
Port mapping in Docker allows you to expose a container's internal port to the host machine, enabling communication with the container. It is done using the `-p` option in the `docker run` command.
cmd example - docker run -p 8080:80 nginx

### Containerize Nodejs Application with Docker
 make a Dockerfile (Keep the name of the file same)
 refer to the file Dockerfile
 to run it type -> docker build -t youtube-nodejs . 
 (NOTE: Here the -t means tag and . means the dockerfile is in the current folder directory)

other cmd
docker run -it youtube-nodejs
docker run -it -p 8000:8000 youtube-nodejs

### Caching Layers in Docker:

Docker images are built in layers, and caching helps optimize the build process by reusing previously built layers if they haven't changed. This makes subsequent builds faster because Docker skips the steps that haven't been modified. For instance, if a layer containing the installation of dependencies hasn't changed, Docker will use the cached version instead of re-running that step.

### Example:

```dockerfile
# Layer 1: Install dependencies (cached if unchanged)
RUN apt-get update && apt-get install -y curl

# Layer 2: Copy application files (cached based on file changes)
COPY . /app
```

### Publishing to Docker Hub:

After building a Docker image, you can publish it to Docker Hub to share it with others. You first need to tag the image with your Docker Hub repository name, then push it using `docker push`.

### Command to Publish:

1. **Tag your image**:

    ```bash
    docker tag my-image username/repository:tag
    ```

2. **Push the image to Docker Hub**:

    ```bash
    docker push username/repository:tag
    ```


This will upload your image to Docker Hub, making it publicly or privately accessible depending on your repository settings.

### Docker Compose

Docker Compose is a tool that allows you to define and run multi-container Docker applications. Using a `docker-compose.yml` file, you can specify the services, networks, and volumes required by your application. Docker Compose makes it easier to manage complex applications by allowing you to define and start multiple containers with a single command.

### Key Features:

- **Multi-container management**: Define multiple containers that work together in a single file.
- **Service definition**: Each service (container) can be configured with its own image, environment variables, volumes, and networks.
- **Scaling**: Easily scale services by specifying the number of replicas for a service.
- **Networking**: Automatically creates a network for the services to communicate within.

### Example `docker-compose.yml` file:

view the file other file i attached
### Common Docker Compose Commands:

1. **Start services**:
    `docker-compose up`
    
    This starts the services defined in the `docker-compose.yml` file. Add `-d` to run in detached mode (in the background):
    
    `docker-compose up -d`
    
2. **Stop services**:
    `docker-compose down`
    
    This stops the services and removes the associated containers, networks, and volumes created by `docker-compose up`.
    
3. **View logs**:
    `docker-compose logs`
    
    This displays the logs for all services. You can specify a service name to view logs for a specific service:
    
    `docker-compose logs web`
    
4. **Build services**:
    `docker-compose build`
    
    This command builds the images defined in the `docker-compose.yml` file.
    
1. **Scale services**:
    `docker-compose up --scale web=3`
    
    This scales the `web` service to run 3 instances (3 containers).
    
6. **Check the status of services**:
    `docker-compose ps`
    
    This lists the status of the containers for the services defined in the `docker-compose.yml` file.
    
7. **Execute a command in a running container**:
    `docker-compose exec <service_name> <command>`
    
    `docker-compose exec web bash`
    
    This opens a shell (`bash`) in the running `web` container.

(use: https://labs.play-with-docker.com/ for testing)



![Screenshot 2025-01-10 163021](https://github.com/user-attachments/assets/19d2385d-6747-4e3e-a5c0-bd88bb231fd7)

![Screenshot 2025-01-10 163103](https://github.com/user-attachments/assets/98822897-aeeb-46f8-b5f0-1a75f7d24821)
