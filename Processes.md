
> Processes has a self-contained execution environment

A #process generally has a complete, private set of basic run-time resources, in particular each process has its own memory space.

To facilitate communication between processes, most operating systems support _Inter Process Communication (IPC)_ resources, such as pipes and sockets.

IPC is used not just for communication between processes on the same system, but processes on different systems.

Most implementations of the Java Virtual Machine runs as a single process. 
A java application can create additional process using a `ProcessBuilder` object
