
[[Threads]] can be created by using two mechanisms in java
1. Extending the Thread class
2. Implementing the Runnable Interface

the import package for thread class in java is `java.lang.Thread`

This class overrides the run() method available in the thread class.
A thread begins its life inside run() method.

We create an object of our new class and call start() method to start the execution of a thread. Start() invokes the run() method on the [[Threads]] object

### Extending the Thread class
#### Sample code

```java
class MultithreadingDemo extends Thread{
	public void run(){
		try{
			System.out.println("Thread " + Thread.currentthread().getId() + " is running");
		}catch(Exception e){
			System.out.println("Exception is caught");
		}
	}
}

public class Multithread{
	public static void main(String[] args){
		int n = 8;
		for(int i=0;i<n;i++){
			MultithreadingDemo obj = new MultithreadingDemo();
			obj.start();
		}
	}
}
```
`

### Implementing the Runnable Interface

#### Sample code

```java
class MultithreadingDemo implements Runnable{
	public void run(){
		try{
			System.out.println("Thread " + Thread.currentthread().getId() + " is running");
		}catch(Exception e){
			System.out.println("Exception is caught");
		}
	}
}

public class Multithread{
	public static void main(String[] args){
		int n = 8;
		for(int i=0;i<n;i++){
			MultithreadingDemo obj = new MultithreadingDemo();
			obj.start();
		}
	}
}
```


### Thread class vs Runnable Interface

-> If we extend the Thread class, our class cannot extend any other class because Java doesnt support multiple inheritance which is opposite for implementing Runnable interface to our custom classes.

-> Using runnable will give you an object that can be shared amongst multiple threads
