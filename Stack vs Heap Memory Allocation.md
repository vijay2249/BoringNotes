
## Stack Memory Allocation

1. Its a temporary memory allocation scheme where the data members are accessible only if the method that contained them is currently running
2. It allocates or de-allocates the memory automatically as soon as corresponding method completes its execution.
3. #Stack_memory allocation is considered safer as compared to #heap_memory allocation because the data stored can only be accessed by the owner thread.
4. memory allocation and de-allocation is faster than compared to head-memory
5. #Stack_memory  has less storage space as compared to #heap_memory 


## Heap Memory Allocation

> The name **heap** has nothing to do with the *heap data structure* 
> It is called a heap because it is a pile of memory space available to programmers to allocate and de-allocate.

Every time when we made an object it always creates in Heap-space and the referencing information to these objects is always stored in Stack-memory

Heap memory allocation isnt as safe as #Stack_memory  allocation because the data stored in this space is accessible or visible to all threads.

Heap memory is accessible or exists as long as the whole application runs