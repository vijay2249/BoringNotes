
 1. #Enum in java - serve the purpose of representing a group of named constants in a programming language
 2. #Java #ENUMS are used when we know all possible values at compile time, such as choices on menu, rounding modes, command-line flags, etc. 
 3. The set of constants in an #enum type doesnt need to stay fixed for all time
 4. 


> #ENUM declaration can be done outside a class or inside a class but not inside a method

---
## Properties of #Enum 

* Every enum is internally implemented by using Class
* Every enum constant represents an **object** of type enum
* Every type can be passed as an argument to **switch** statements.
* Every enum constant is always implicitly **public static final**. 
	* Since it is **static** we can access it by using enum name
	* Since it is **final**, we cant create child enum
* All enums implicitly extended **java.lang.Enum** class. As a class can only extend one parent in Java, an enum cannot extend anything else