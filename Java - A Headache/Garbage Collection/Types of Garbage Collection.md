
**Application throughput** denotes the speed at which a Java application runs

**Application pause** means the time taken by the garbage collector to clean the unused memory spaces.

### Serial Garbage Collector

This works with a single thread

When we select this as a default GC( #Garbage_Collector ) then it holds all running threads of application i.e, it works by freezing all the application threads and it will create a single thread to perform garbage collection. 

It uses only single thread to perform the garbage collection process
### Parallel Garbage Collector

This is current default garbage collector in Java 8. Also called **Throughput collector** 
It is similar to [[Types of Garbage Collection#Serial Garbage Collector]] except that it uses multiple threads for garbage collection process

This is far better than serial garbage collector but the problem with the parallel garbage collector is it pauses the application during minor operations also.
### CMS Garbage Collector

It is also known as **concurrent mask-sweep garbage collector**
CMS garbage collector will perform freezing of running threads i.e, application pause in two cases only.
1. While performing the garbage collection, if there is a change in heap memory in parallel
2. While marking the referenced objects in the old generation space.

CMS collector uses more CPU to ensure better application throughput.

If we are developing an application where we can provide more CPU resources for better performance then CMS garbage collector is the blockquoteferred choice over the parallel collector.

### G1 Garbage Collector

It is default garbage collector for Java 9

Unlike other collectors, the G1 collector partitions the heap space into multiple equal sized regions.
Basically it is mainly designed for an application having heap size greater than 4GB.




