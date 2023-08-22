#Lambda_Expressions let you pass around snippets of custom code, giving you so much more functionality than you might otherwise be able to achieve, and with very little effort.

A [[Lambda Expressions]] can be thought of as implicit code for an anonymous class, using a special kind of interface, as the mechanics to do this.

### Basic example
```java
public class Main{
	record Person(String firstName, String lastName){
		@Override
		public String toString(){
			return firstName+ " " + lastName;
		}
	}

	public static void main(String[] args){
		List<Person> people = new ArrayList<>(Arrays.asList(
						new Main.Person("Lucy", "Browm");
						new Main.Person("Dr.", "Strange");
						new Person("Charlie", "Brown");
		));
		var comparatorLastName = new Comparator<Person>(){
			@Override
			public int compare(Person o1, Person o2){
				return o1.lastName().compareTo(o2.lastName());
			}
		};
		people.sort(comparatorLastName);
		people.sort((o1,o2) -> o1.lastName().compareTo(o2.lastName()));
	}
}
```

The lambda expression parameters are determined by the associated interface's method, the functional method

__*Q*__. Now in general we create this Lambda function as anonymous functions or classes or objects, in that case how can one be sure about which function that lambda function is referring to?
**Ans**:
	For lambda expressions, the _method is inferred_ by #Java 
	Following up, Java takes its clue from the reference type, in the context of the lambda expression usage.
	
```java
	void sort(Comparator c)
	//here is the call to the sort method passing the lambda expression
	people.sort((o1, o2) -> o1.lastName().compareTo(o2.lastName()));
	//from this java can infer that this lambda expression, resolves to a Comparator Type, because of the method decleration
	//This means the lambda expression passed, should represent code for a specific method on the Comparator interface
```

As mentioned in the example, how does it know which method to infer??
-> Well, there is only one the lambda expression cares about, and that is the __abstract method__ on Comparator(in the above example, in general it is the __abstract method of the referred class/method__)

For this to achieve Java has a feature called, #Functional_Interface
A __Functional Interface__ is an interface that has _one and only one abstract method_

This is how Java can infer the method, to derive the parameters and return type, for lambda expression

Now adding to the above example, 
```java
public static void main(String[] args){
	List<Person> people = new ArrayList<>(Arrays.asList(
					new Main.Person("Lucy", "Browm");
					new Main.Person("Dr.", "Strange");
					new Person("Charlie", "Brown");
	));
	var comparatorLastName = new Comparator<Person>(){
		@Override
		public int compare(Person o1, Person o2){
			return o1.lastName().compareTo(o2.lastName());
		}
	};
	people.sort(comparatorLastName);
	people.sort((o1,o2) -> o1.lastName().compareTo(o2.lastName()));
	interface EnhancedComparator<T> extends Comparator<T>{
		int secondLevel(T o1, T o2);
	}

	var newComparator = new EnhancedComparator<Person>(){
		@Override
		public int compare(Person o1, Person o2){
			int result = o1.lastName().compareTo(o2.lastName());
			return (result == 0 ? secondLevel(o1,o2) : result);
		}

		@Override
		public int secondLevel(Person o1, Person o2){
			return o1.firstName().compareTo(o2.firstName());
		}
	}

	people.sort(newComparator);
	System.out.println(people);
}

```

Now in the above situation the code works file and if there are any same last name people then the output list is again sorted based on their first name basis.

In this case, however we cant use any lambda expressions..
Coz => In this situation there are two interface abstract methods, and java doesnt know which one to pick to put the lambda expression methods in.
Alternative => There is a solution for this type of problem
	In what ever the interface (custom interface) you created to use your custom logic, add an [[annotation]] to that interface as [[annotation#FunctionalInterface | @FunctionalInterface]]
	But this should also follow the rule that the functional interface also should have only one abstract method in it.


* Many of Java's classes, use [[annotation#FunctionalInterface | functional interfaces]] in their signatures, which allows us to pass lambdas as arguments to them.

 * You cannot use the same parameter names in the lambda expression and outside the lambda expressions

Its better to know the four basic categories of Functional Interfaces in java.util.function package

| Intreface category | Basic Signature Method | Purpose                                     |
| ------------------ | ---------------------- | ------------------------------------------- |
| _Consumer_         | void accept(T t)       | execute code without returning data         |
| _Function_         | R apply(T t)           | Return a result of an operation or function |
| _Predicate_        | boolean test(T t)      | test if a condition is true or false        |
| _Supplier_                   | T get()                        | return an instance of something                                             |


---
#### Method References

Methods which can be used, are based on the context of the lambda expression
This means the method reference, is again dependent on the targeted interface's method

You can reference a static method on a class
You can reference an instance method from either an instance external to the expression or an instance passed as one of the arguments
You can reference a constructor by using "new" as the method

Method references can be used to increase the readability of the code.