
 > #JAVA itself manages the memory and needs no explicit intervention of the user/developer
 
 > #Garbage_Collector itself ensures that the unused space gets cleaned and memory can be freed when not needed
 
**However, the automatic garbage collection doesn't guarantee everything**

---
## Major concepts in Java Memory Management

### JVM Memory Structure

JVM defines various run time data area which are used during execution of a program.
Some of the areas are created by the JVM whereas some are created by the threads that are used in a program.

The memory area created by JVM is destroyed only when the JVM exists
The data areas of thread are created during instantiation and destroyed when the thread exits

![[Pasted image 20230812121853.png]] - source [geeksforgeeks.org](https://geeksforgeeks.org) 

#### Heap
1. It is a shared runtime data area and stores the actual object in memory. It is instantiated during the virtual machine startup
2. This memory is allocated for all class interfaces and array
3. Heap can be fixed or dynamic size depending upon the systems configuration
4. When a *new* keyword is used, the object is assigned a space in head, but the reference of the same exists onto the stack
5. There exists one and only one heap for running a JVM process
#### Method Area
-> This memory is allocated for class structures, method data and constructor field data and also for interfaces or special methods used in class.
-> Can be fixed size or expanded as required by the computation. Needs not be contiguous
#### JVM Stacks
=> Stack is created at the same time when a thread is created and is used to store data and partial results which will be needed while returning value for method and performing dynamic linking
=> Stacks can either be of fixed or dynamic sizes. The size of a stack can be chosen independently when it is created.
=> The memory for stack needs not to be contiguous

#### Native method stacks
--> Also called as C stacks, native method stacks are not written in Java language. This memory is allocated for each thread when its created. And it can be fixed or dynamic in nature
#### Program Counter(PC) registers

1. Each #JVM #thread which carries out the task of a specific method has a program counter #register associated with it.
2. The non native method has a PC which stores the address of available JVM instruction whereas in a native method, the value of the program counter is undefined.
3. PC register is capable of storing the return address or a native pointer on some specific platform

---
### Working of Garbage Collector

>> Garbage collection process causes the rest of the processes or threads to be paused and thus is costly in nature.
>> The process of applying algorithm is often termed as **Garbage Collector tuning** and is important for improving the performance of a program

Most Importantly see [[Stack vs Heap Memory Allocation]] on how garbage collection uses the efficiency of stack and heap memory allocations
