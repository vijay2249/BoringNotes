
> Exception handling in Java is one of the most effective means to handle runtime errors so that regular flow of the application can be preserved

>Java exception handling is a mechanism to handle runtime errors such as **ClassNotFoundException**, **IOException**, **SQLException**, **RemoteException**, etc.


## What are these?
_Exception_ is unwanted or unexpected event, which at #run-time  disrupts the normal flow of the programs instructions.

When an exception occurs within a method, it creates an Object. This object is called _Exception Object_

Important thing is that JAVA allows users to define their own custom exceptions


### How does JVM Handle an Exception

1. If an exception has occurred, the method creates an Object known as Exception Object and hands it off to the run-time system.
2. Creating the Exception object and handling it in the runtime system is called throwing an Exception.
3. There might be a list of methods that had been called to get to the method where an exception occurred.
4. This ordered list of methods is called **Call Stack**

---

External resource for Java Exceptions [here](https://docs.oracle.com/javase/7/docs/api/java/lang/Exception.html) - Oracle java docs

[[Checked Exceptions]]

[[Unchecked Exceptions]]
