# Data in Docker

\#Data\_in\_Docker

\#Volume

## Data

There is essentially three types of data in Docker -> also in connection with \[\[Volumes]]

### Application Data

1. Data added to the image and container in the build phase
2. Cant be changed once the image is built
3. Example: source code of application

### Temporary Data

1. Data is updated while interaction
2. Fetched/produced in running container
3. No effect in loosing the data once the container is shutdown
4. Dynamic and changing but clears regularly
5. Need read + write permission temporarily, hence data is stored in containers layer

### Permanent Data

1. Fetched/produced in running container
2. Stored in files or in a database
3. Must not be lost if container stops or restarts
4. Read + write permission is required

> Data will not be removed from a container if you just stop the container or the container restarts

> All the containers will different [file system](<Images and containers.md#File system in docker>), hence if there is any files that are updated in one container that same scenario cannot be seen in another container
