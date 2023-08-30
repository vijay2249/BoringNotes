```java

Thread t = new Thread(new Runnable(){
					  @Override
					  public void run(){}
});
```

The above one-line statement to create a new thread.
Here in the above code we are creating a Runnable as an anonymous class.

To start a thread execution
```java
t.start(); //t => see above section of code
```
To start a thread we call the "start()" method on the thread, and the functionality of the thread is written in the "run()" method of the class that extends [[Threads]] class
### Main thread in JAVA
When a JAVA program starts up, one thread begins running immediately. This is usually called the _main thread_ of our program because it is one that is executed when our program begins.

There are certain properties associated with the main thread which are as follows:
1. It is the thread from which other child threads will be spawned
2. Often, it must be the last thread to finish execution because it performs various shutdown actions.


The order of threads depends on the threads priority value and the actual cpu scheduling that depends on the system and its configurations

You cannot run the same thread multiple like you cannot call start() method on the same instance of thread multiple times, this throws an [[Java - A Headache/Errors#ThreadExceptions|Thread Exceptions in Java]]

