

-----
[[Threads]] in Java at any point of time exists in any one of the following states.

##### 1. New State

-> When the new thread is created, it is in the new state.
-> The thread has not yet started to run when the thread is in this state.
-> When a thread lies in the new state, its code is yet to be run and hasn't started to execute.

##### 2. Runnable State
--> A thread is ready to run is moved to a _runnable state_ .
--> In this state, it is the responsibility of the ***thread scheduler*** to give the thread, time to run.
--> Each and every thread runs for a short while and then pauses and relinquishes the CPU to another thread so that other threads can get a chance to run.
--> When this happens, all such threads that are ready to run, waiting for the CPU and the currently running thread lie in a runnable state.
##### 3. Blocked State
==> When a thread is temporarily inactive, then it is in one of the following states.
1. Blocked
2. Waiting

##### 4. Waiting State

##### 5. Timed Waiting State
--> Thread lies in this state when it calls a method with a time-out parameter.
--> A thread lies in this state until the timeout is completed or until a notification is received

##### 6. Terminated State
1. A thread terminates because of
	1. coz _it exits normally_
	2. coz _there occurred some unusual erroneous event like segmentation fault or unhandled exception


In a nutshell/picture the threads state looks like the pic
![[Thread-phases.png]] - source geeksforgeeks.com


___

### Implementing #Thread states in #Java

In java the Thread

##### An example
```java
class thread implements Runnable{
	public void run(){
		try{ Thread.sleep(1000);}
		catch(InterruptedException e){e.printStackTrace();}
		System.out.println("Thread state: " + Test.thread1.getState());
		try{ Thread.sleep(2000);}
		catch(InterruptedException e){ e.printStackTrace();}
	}
}

public class Test implements Runnable{
	public static Thread thread1;
	public static Test obj;
	public static void main(String[] args){
		obj = new Test();
		thread1 = new Thread(obj);
		// Thread created and is currently is in the new state.
		System.out.println("Thread state: " + thread1.getState());
		thread1.start();

		//thread moved to runnable state.
		System.out.println("Therad state: " + thread1.getState());
	}
	public void run(){
		thread myThread = new thread();
		Thread thread2 = new Thread(myThread);

		System.out.println("Thread2 State: " + thread2.getState());
		thread2.start();

		System.out.println("Thread2 state: " + thread2.getState());

		try{ Thread.sleep(3000);}
		catch(InterruptedException e){ e.printStackTrace(); }
		System.out.println("Thread2 state: " + thread.getState());
	}
}
```