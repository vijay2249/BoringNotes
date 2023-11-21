# Volumes

\=> There are cases that the data is required to share between the container&#x20;

\=> To tackle this issue Docker has a built in solution in the form of ==**Volumes**==&#x20;

\=> We can also use volumes for persistent data =>Volumes persists if a container is shutdown. If a container restarts and mounts a volume, any data inside that volume is available in the container

### What are Volumes

* Volumes are folders in your host machine hard drive which are mounted into containers
* These folders are created by docker in your host machine and then are mapped into the path specified by you in the docker container file system

***

_\<I just came up with this Line of explanation >_

* Hence any change in the local system will affect the container file structure and vice versa as the files are mounted hence the content is written by reference but not by just data

***

\[\[Containers]] can read and write data in the volumes

***

There are three types of #Volume (s)

### Volumes types

#### Anonymous Volumes

\#AnonymousVolumes

1. These are created when new container is created
2. These volumes gets destroyed when the **container is deleted, but not stopped**
3. These volumes gets assigned a random unique name/hash number for reference
4. The location of these volumes is managed by docker and by default it is hidden from user
5. You can still see the location and details about the volume using the ==docker volume --help== [command](Commands.md)

#### Named Volumes

\#NamedVolumes

1. These volumes are manually created by user
   1. the name of the volume is given by user
   2. The rest stays the same as anonymous volumes
2. Unlike anonymous volumes these volumes are persistent says that these are not deleted even the container is pruned

#### Bind Mounts

\#BindMounts

1. In this type of volumes, you specify the path where the data is to be stored by docker
2. Means that the location of volume is specified by user
3. This is great for data persistent
4. Allows read + write permissions by container
5. This is also useful for real-time source code updates in container without re-building the image again and again

***

### Information

> In general the container volumes have read-write permissions to the container, but you can specify specific permissions like read-only operation on the volume specified

By default these volumes are read + write permissions/access We can specify it as read-only volume by add ==:ro== at the end to ==-v== flag usage in the #docker\_run command while specifying #Volume

Now there is possibility that the command to execute having a long paths etc, also we need to keep track of all the dependencies and changes in the commands multiple times in multiple places if there are any

Tackling this issue => \[\[Docker Compose]]
