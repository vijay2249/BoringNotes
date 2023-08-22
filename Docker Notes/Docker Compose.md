#Docker_Compose #DockerCompose
## Intro
This is a tool to run and execute multiple docker run and docker build commands to work with a single file for multiple containers setup and building 

## Getting started
1. Start by creating #docker-compose.yml file in project folder
2. [Yaml] is a specific text format where you use indentation to express dependencies between configuration and data nececssary

=> We define all the containers under the service keyword, we can define multiple containers in one service keyword

=> By default when the service is down from #docker-compose , the [[Containers]] are auto removed, hence the ==--rm== flag is not necessary in docker compose file configuration 

=> Docker compose automatically creates a [network](Communication) and add all the mentioned containers to that network
=> You can also manually define the container network in the docker-compose configuration file

=> For all the volumes that are included in the configurations, you need to add them to the volumes key in the top level same level as the services, and add the names of the volumes as child with no value to the children #Docker-compose-volume 
=> This lets [[Docker Compose]] know that there are named volumes

=> For [[Volumes#Bind Mounts]] you need to specify the relative path from the docker-compose file in the configurations instead of full path that we mention in the #docker_command [[Commands]] 
=> Also [[Volumes#Bind Mounts]] dont need to be added in the volumes children where we specify all the volumes separately #Docker-compose-volume 


## #Important_Docker 

[[Docker Compose]] does not replace [[Dockerfile]] for custom images building process, it works along side with [[Dockerfile]] 

> Docker compose is not suitable for multiple container managed on different hosts

> Top level ==version== property is defined by the Compose Specification for backward compatibility
> This is not a necessary key that needs to be defined in the latest docker v2 compose files


