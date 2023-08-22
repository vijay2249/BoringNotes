

## Commands Table

| Command        | Description                                                                                                                          | Usage                                   | Example                                         | More Info       |
| -------------- | ------------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------- | ----------------------------------------------- | --------------- |
| #WORKDIR       | Specify the working directory of the project in the docker file system                                                               | WORKDIR \<folderPath>                   | WORKDIR /app                                    | null            |
| #CMD           | The initial command to execute when the container is build, this command executes only when the container is up                      | CMD ["cmd1", "cmd2"]                    | CMD ["node", "app.js"]                          | null            |
| #RUN           | This is another way to specify the commands to execute while building the image, this command executes when the image is being build | RUN \<command>                          | RUN npm install                                 | null            |
| docker #build  | #Docker command to build specific images                                                                                             | docker build \<pathToDockerfile>        | docker build .                                  | #docker_build   |
| docker run     | #Docker command to run the image specified alias start the container                                                                 | docker run \<imageID>                   | docker run node                                 | #docker_run     |
| docker ps      | #Docker command to list all the containers that are currently up and running                                                         | docker ps                               | docker ps                                       | #docker_ps      |
| docker stop    | #Docker command to stop the running container                                                                                        | docker stop \<containerID>              | docker stop node                                | null            |
| docker logs    | #Docker command to see the logs of the container                                                                                     | docker logs \<containerID>              | docker logs node                                | null            |
| docker inspect | #Docker command to display information about the images and containers                                                               | docker container inspect \<containerID> | docker container inspect explainlike5/users-app | #docker_inspect |
| docker cp      | #Docker command to copy files from container/image to local system                                                                   | docker cp \<source> \<dest>            | docker cp \<Local_rel_path> \<contID>:<path_in_container_fileSystem> | #docker_cp                |

---

## Info

>For all docker commands where ID can be used, you dont always have to copy/write the full id
>
>You can also just use the first few characters - just enough to have a unique identifier from the containers that you have

>All the containers generated will be virtualized from your host system

> Most of the images have #docker_run command in interactive mode
> But the #docker_start command runs the process in background

>You can ==name== docker container using the ==--name== tag in the #docker_run  command


___

## #CMD vs #RUN 

> Consider an example of #NodeJs application, we want to run the server only when the container is up not every time the image is created hence we use #CMD to specify the commands to execute them when the container is up, 
> But for that image/application we require npm modules in our code as dependencies, to get all the #npm_modules in our code, we execute the #RUN command to execute the command every time the image is build
> 


> #CMD is little bit similar to #GRUB bootloader system in operating systems

## #docker_build 
1. This creates a new docker image with a image id hash number specific to that image
2. We can add custom names to our image using ==-t== or ==--tag== flag

## #docker_run
1. ==-p== (port) flag
	1. this flag is used to expose the application to host system from the docker engine
	2. usage: -p \<ExposedPort>:\<InternalDockerPort>
	3. this exposed port is from the local system
	4. InternalDockerPort is from which port to connect to in the docker engine
2. If you dont have that image specified in the command locally in your system then docker reaches docker hub and searches for this image and downloads it for you then it fires up the container 
3. To interact with the container example node container you have to use the ==-it== flag along with the command

## #docker_inspect 

1. you can inspect images also using the ==_docker images inspect_== command

## #docker_cp 

1. This command can be replaced by [[Volumes#Bind Mounts]]


---
## #Important_Docker
-> To execute the system command, we can use the #CMD command in the [[Dockerfile]], if you don't specify a #CMD , the CMD of the base image will be executed.

> With no base image and no #CMD , you will get an error

**You cannot remove a running container, to delete that particular container you need to stop the container and then remove the container**

**Similarly you cannot remove the images that are being used by containers that are up and running, for that you need to stop the container then you can delete the image**
