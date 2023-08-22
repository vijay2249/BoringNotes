
#JVM ( #JAVA_VIRTUAL_MACHINE ) is an abstract machine,

It is a program which takes the #Java  #bytecode and converts the byte code (line by line) into #machine_code

#JVM acts as a #run-time engine to run java applications

### Operations performed by #JVM 

1. Loading of code
2. Verification of code
3. Executing the code
4. It provides a #run-time environment to the users


### Memory Areas Allocated by JVM

![[Pasted image 20230813094232.jpg]]

#### Class (Method) Area

-> This is the area in the memory block that stores the class code, variable code, method code, and the #constructor-method of the Java program

#### Heap

-> This is memory block where objects are created or objects are stored.
-> Heap memory allocates memory for class interfaces and arrays. 
-> Allocates memory to objects at run time

#### Stack
-> Each #thread has a private JVM stack, created at the same time as the thread.

-> More information at [[Stack vs Heap Memory Allocation]]

#### Program Counter Register
[[Java Memory Management#Program Counter(PC) registers]]

#### Native method Stacks
[[Java Memory Management#Native method stacks]]
