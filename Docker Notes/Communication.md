# Communication

alias #Networking in #Docker

#### Docker Communication

\#Docker\_Network #Communication #Network

Its good to have separate environments for different application, but how does these containers talk to each other

Now Docker by default wont creates a network in which these containers do live in.

But each container is assigned an IP address by default by docker we have to create new network using the ==docker network== command and use ==--network== flag in #docker\_run command to set the container to run in that specified network.

Docker automatically assigns IP address to the container

For communication between containers you can mention the IP address of the containers in the URL request/response in the source code

Now for communication there are three possibilities

1. Container to Container Communication \[#Docker\_CCC]
   1. If the containers are placed in the same network then we can communicate via replacing the IP address of the container by the container ID
   2. If the containers are not in the same network then there is no other option than to communicate based on the IP address of each containers
2. Container to Outside Websites Communication \[#Docker\_COWC]
   1. By default docker allows this type of communication
   2. This means that if we want data from [swapi.com](https://swapi.com) we can get it using its api
3. Container to local system Communication \[#Docker\_CLSC]
   1. for this you need to replace the #IP\_Address of local machine to "host.docker.internal"
   2. This lets docker know that there is communication between the container and the local machine
   3. Docker does all the behind the scenes stuff to figure out the connection between local system and container

#### #Important\_Docker

> Docker will not change/replace any section in the source code.
>
> Since docker owns the environment, it simply detects the outgoing and incoming requests and resolves the #IP\_Address of each request and response as such considering the names and other configurations of the containers(if any specified)

### Docker Network Drivers

\-> Docker networks actually support different kinds of #drivers\_docker which influence the behavior of the network&#x20;

\-> The default driver is the _"bridge"_ driver - it provides the behavior as mentioned \[above]\(#Docker Communication)

\-> We can specify the driver when a network is created by simply adding the ==--driver== flag in #docker\_command

### Alternative Drivers

#### host

```
For standalone containers, islocation between container and host system is removed
This means that container and local system share the same network
```

#### Overlay

```
Multiple docker daemons are able to connect with each other
Only works in "Swarm" mode which is a dated deprecated way of connecting multiple containers
```

#### macvlan

> you can set ==custom mac address== to a container This address can be then used for container communications

#### none

\=> Networking is disabled

\==**Container Networking Model**==
