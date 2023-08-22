
## What is it?

-> _A thread is a light-weight sub-process, the smallest unit of processing_

-> Also defined as _unit of execution within a [[Processes]]_

-> _Multiprocessing and multithreading, both are used to achieve multitasking_

> Threads use a #Shared_Memory area.
> They dont allocate separate memory area so saves memory and context switching between the threads takes less time than process.


### Different types of threads

There are two types of threads in an application - `user thread` and `daemon thread` 
When we start an application, the main is the first user thread created.
When all the user threads are executed, #JVM terminates the program.

### #Thread_Priority
When we create a thread, we can assign its priority.
>We can set different priorities to different threads but it doesnt guarantee that a higher priority thread will execute first than a lower priority thread 


The #thread_scheduler is the part of Operating System implementation and when a thread is started, its execution is controlled by Thread Scheduler and JVM doesnt have any control over its execution.


Threads exist within a [[Processes]] - every process has at least one.
