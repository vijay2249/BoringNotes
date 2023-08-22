
It is a process in Java by which the Java programs perform automatic memory management.

Java programs compile to byte code that can be run on a #JAVA_VIRTUAL_MACHINE 

---
### What is it?

In C/C++ programmer is responsible for both creation and destruction of objects that takes up space in the actual memory.

If programmer neglects the destruction of useless objects, sufficient memory may not be available to create new objects, and the entire program will terminate abnormally, causing #OutOfMemoryError 

The main objective of #Garbage_Collector  is to free #heap_memory  by destroying **unreachable objects**

The garbage collector is best example of the *Daemon thread* as it is always running in the background


### How does it work...?

-> This is an automatic process. It is the process of looking at heap memory, identifying which objects are in use and which are not and deleting the unused objects.

-> The garbage collection implementation lives in the #JVM 

---
### Activities in JAVA Garbage Collection

#### Minor or incremental Garbage Collection

It will occur when unreachable objects in the young generation heap memory are removed.

#### Major or Full Garbage Collection

It will occur when the objects that survived the minor garbage collection are copied into the old generation or permanent generation heap memory are removed.

When compared to young generation, garbage collection happens less frequently in the old generation



Once we make an object eligible for garbage collection it may not destroy immediately by garbage collector. Whenever JVM runs the garbage collector program, then only the object will be destroyed.

> When the JVM runs the #Garbage_Collector  - **we cannot predict it**


**Basically Garbage Collector use [*Mark and Sweep algorithm*](https://www.geeksforgeeks.org/mark-and-sweep-garbage-collection-algorithm/) to clear unused memory**


[[Types of Garbage Collection]]
