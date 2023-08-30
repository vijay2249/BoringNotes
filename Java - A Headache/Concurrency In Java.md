
In java, every process(or application) has at least one thread, the _**main thread**_ (for UI applications, this is called the **JavaFX application thread** )

Every java application run as a single process, and each process can have multiple threads
Every process has a heap, and every [[Threads]] has a #thread_stack 

**Concurrency** refers to an application doing more than one thing at a time.
It also means that one task doesn't have to complete before another can start

In addition to the process's memory, or heap, each thread has what's called a *thread stack*

<font color='green'>Thread Stack</font> is the memory that only that thread can access

Every process has a *heap* and every thread has a *thread stack* 

Learn [[Threads in JAVA]]
