# Images and containers

First lets define these things

#### Definition

> \==Containers== is just a piece of code for an application - alias - running a unit of software #Containers are based on #images

> \==Images== are _blueprint_(templates) of the software Images contain the code and required tools/runtimes for the application

\-> From a single image we can spawn multiple containers -> We run #Containers based on #images

***

#### File system in Docker

\#Docker\_FileSystem

\-> Every image/containers has its own internal **file system** that is _detached_ from user file system It is hidden away inside of the #DOCKER container

**Generally it is not recommended to use the root folder in the docker file system to save your code**

Create a workspace directory to upload/save your code in docker image file system

> Its this workspace all the commands that you want to execute will work, and for the safe side of this file system in the docker system it is recommended in this way to continue the work

By default the working directory is the root folder in the container file system

_We can modify the working directory of the container using the command #WORKDIR_

***

### Creating Images

Lets create these images and containers

1. Before creating custom docker images, we need to create a file in project directory called \[\[Dockerfile]]
2. We write the instructions of what the image should perform or how we save the image the docker hub

### Images

\=> Once we create our image using the \[\[Dockerfile]] the image is locked and loaded&#x20;

\=> This means that the code inside the image is cannot be changed, its read only mode&#x20;

\=> To have any effect on the code inside the image you either need to rebuild the image or have to use [Bind Volumes](../Docker%20Notes/Volumes/#BindVolumes)

> Updating source code in docker image via bind mounts -> [here](../Docker%20Notes/Volumes/#BindMounts)

**Layer Based Architecture**

\=> Whenever you build an image docker caches every instruction result, when you build an image&#x20;

\=> Then it will use this cached results to verify and check if there is any need for executing the same command again while re-building the image&#x20;

\=> Once the instruction yields a new result or generate a new layer, then it results in executing all the instruction from that instruction to all the instruction that are written below that statement

While building an #images and sharing them, we might want to ignore some of the files like [git](obsidian://open?vault=My\_Notes\&file=Git%20and%20Github%2FGIT) files or \[\[dockerignore]] files or any \[\[Environment Variables]]

### Environment Variables

Environment variables can be used in \[\[Dockerfile]] using the \[\[Commands]] ==ENV \<key> \<value>==&#x20;

The other way is you specify them in the #docker\_command using the --env flag&#x20;

_Usage: --env \<key>=\<value>_&#x20;

Multiple env flags are used in case of multiple variables

Coming to build arguments you can specify them using the ==--build-arg== flag in the #docker\_command
