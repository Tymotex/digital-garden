---
title: Docker Compose
description: Docker Compose
---

![[Knowledge/Engineering/Technologies/assets/docker-compose.png|300]]

[Docker Compose](https://docs.docker.com/compose/) is a CLI tool for running and coordinating the communication of multiple [[Knowledge/Engineering/Technologies/Docker|Docker]] containers. It's a *container orchestrator*, like [[Knowledge/Engineering/Technologies/Kubernetes|Kubernetes]]. You just have to supply a YAML config file with all the info needed for running each container, then with a single command they'll all get created and started. You can also tear everything down instantly.
- `docker-compose.yml` is kept at the root of the project
- It can create networks and attach containers to them and create volumes

```bash
docker-compose up      # Starts up all services using `docker-compose.yml`
    -d                 # Run in the background (detached)
    --build            # Force-trigger a build
    -f <file>          # Path of the compose file. By default, `docker-compose.yml` is expected in the cwd

docker-compose down    # Tear down all services
    --volumes          # Also remove volumes

docker-compose logs
    -f                 # Follow the live output rather than just dumping it all out on the terminal once
                       # It'll interleave the output of all the running services 
```

Docker Compose supports the concatenation of multiple YAML compose files to get a 'merged' compose file where more specialised compose files will overwrite rules in the one before it.

It's common practice to have multiple compose files with slight variations. Eg. in addition to a 'shared' compose file, `docker-compose.yml`, which contains all the config common to both dev and prod, you might also have `docker-compose-dev.yml` and `docker-compose-prod.yml` defining specific setups for development and production. In development for example, you might have a bind mount set up so that you can have hot reloading in the container. But for production, you wouldn't want this

### Example
In the [official Docker tutorial](https://docs.docker.com/get-started/08_using_compose/), we're using these 2 commands to startup our app server and database server:
```bash
# Backend server container startup:
docker run -dp 3000:3000 \
  -w /app -v "$(pwd):/app" \
  --network todo-app \
  -e MYSQL_HOST=mysql \
  -e MYSQL_USER=root \
  -e MYSQL_PASSWORD=secret \
  -e MYSQL_DB=todos \
  node:12-alpine \
  sh -c "yarn install && yarn run dev"

# Database server container startup:
docker run -d \
	--network todo-app \
	--network-alias mysql \ 
	-v todo-mysql-data:/var/lib/mysql \
	-e MYSQL_ROOT_PASSWORD=secret \
	-e MYSQL_DATABASE=todos \
	mysql:5.7                  
```

From this, we can create the following `docker-compose.yml` file:
```yaml
# Docker Compose version: *https://docs.docker.com/compose/compose-file/* 
version: "3.7"

# The list of containers we want to run
services:
	app:    # You can pick any name for the service. This will later become the network alias. See https://docs.docker.com/engine/reference/commandline/network_connect/#create-a-network-alias-for-a-container.
		image: node:12-alpine                        # Base image
		command: sh -c "yarn install && yarn dev"    # Command to run on startup. Note that the `-c` tells `sh` to run the given string
		ports:
			- 3000:3000
		working_dir: /app
		volumes:                       # Volume mapping
			- ./:/app
		environment:
			MYSQL_HOST: mysql          # This should be the same as the **network alias** of the database server
			MYSQL_USER: root 
			MYSQL_PASSWORD: secret
			MYSQL_DB: todos
	mysql:                            
		image: mysql:5.7
		volumes:
			- todo-mysql-data:/var/lib/mysql
		environment:
			MYSQL_ROOT_PASSWORD: secret
			MYSQL_DATABASE: todos

# Named volumes *aren't automatically created* with Docker-Compose. They need to be listed:
volumes:
	todo-mysql-data:
```
**Note**: Docker Compose *does not replace* your Dockerfile. See this relevant [StackOverflow post](https://stackoverflow.com/questions/44036337/how-to-convert-a-dockerfile-to-a-docker-compose-image).

Now you just need to run `docker-compose up -d` and both these containers will be created, along with an isolated network and the volumes you listed:
![[Knowledge/Engineering/Technologies/assets/docker-compose-example-output.png|400]]

## Docker Compose vs. Kubernetes
The main difference is that Kubernetes can run and scale containers across multiple computers, but Docker Compose runs containers on a single host machine.
> If you are networking containers within the same host go for **docker compose**. If you are networking containers across multiple hosts go for **kubernetes**. ([source](https://stackoverflow.com/questions/47536536/whats-the-difference-between-docker-compose-and-kubernetes))

![[Knowledge/Engineering/Technologies/assets/docker-compose-vs-kubernetes.png|400]]
*(Sourced from [theserverside](https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/What-is-Kubernetes-vs-Docker-Compose-How-these-DevOps-tools-compare))*
